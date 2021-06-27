//
//  APIManager.swift
//  Movies
//
//  Created by Sandy Ambarita on 26/06/21.
//

import Foundation
import UIKit

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

public typealias Parameters = [String: Any]?
public typealias QueryParameters = [String: String]?
public typealias HTTPHeaders = [String: String]?

open class Connection {
    open class func request(_ method: HTTPMethod, url: String, parameters: Parameters = nil, headers: HTTPHeaders = nil, completionHandler: @escaping (Data?, Int?, Error?) -> Void) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        print("request\(request)")
        if method == .post && parameters != nil {
            //print("parameters: \(parameters)")
            let data = try! JSONSerialization.data(withJSONObject: parameters!, options: JSONSerialization.WritingOptions.prettyPrinted)
            let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            request.httpBody = json?.data(using: String.Encoding.utf8.rawValue)
            
            
        }
        
//        print("request.httpBody: \(json)")
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (data, urlResponse, error) in
            DispatchQueue.main.async {
                let httpResponse = urlResponse as? HTTPURLResponse
                print("request: \(request)")
                
                //PRINT RESPONSE
                
                if data != nil {
                    if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers), let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                        print(String(decoding: jsonData, as: UTF8.self))
                    } else {
                        print("json data malformed")
                    }
                }
                
                if httpResponse?.statusCode == 500 {
                    print("error")
                    completionHandler(data, httpResponse?.statusCode, error)
                } else if httpResponse == nil {
                    print("error")
                    guard let err = error else { return }
                    switch err._code {
                        case NSURLErrorNotConnectedToInternet:
                            let alert = UIAlertController(title: "Information", message: "Tidak ada koneksi internet.", preferredStyle: UIAlertController.Style.alert)
                            
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
                                
                            }))
                            let vc = UIApplication.topViewController()
                            vc?.present(alert, animated: true, completion: nil)

                        default:break
                    }
                    completionHandler(data, httpResponse?.statusCode, error)
                    
                    return
                } else if error == nil {
                    completionHandler(data, httpResponse?.statusCode, nil)
                } else {
                    print("error")
                    completionHandler(data, httpResponse?.statusCode, error)
                    
                    return
                }
            }
        }
        task.resume()
        
    }
}
