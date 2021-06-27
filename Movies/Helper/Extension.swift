//
//  Extension.swift
//  Movies
//
//  Created by Sandy Ambarita on 26/06/21.
//

import Foundation
import UIKit
import Kingfisher

extension URLComponents {
    mutating func setQueryItems(with queryParams: [String: String]) {
        self.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}

extension String {
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dates = formatter.date(from: self)
        formatter.dateFormat = "dd MMM yyyy"
        let datesFormat = formatter.string(from: dates ?? Date())
        return datesFormat
    }
}

extension UIImageView {
    func loadFromUrl(path: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        let url = URL(string: "\(Endpoint.BaseImage)\(path)")
        self.kf.setImage(with: url)
        self.contentMode = mode
    }
}

extension UIView {
    func dropShadow(shadowColor: UIColor,
                    fillColor: UIColor ,
                    opacity: Float,
                    offset: CGSize,
                    radius: CGFloat)  {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        
    }
}

extension UIApplication {
    
    // MARK: - Get current view controller
    
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
