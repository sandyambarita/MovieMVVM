//
//  ReviewDetailVC.swift
//  Movies
//
//  Created by Sandy Ambarita on 27/06/21.
//

import Foundation
import WebKit

class ReviewDetailVC: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    internal var linkUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
    
        if let myURL = URL(string: linkUrl ?? "") {
            self.webView.load(URLRequest(url: myURL))
        }
    }
    
    func showActivityIndicator(show: Bool) {
        if show {
            // Start the loading animation
            loadingIndicator.startAnimating()
        } else {
            // Stop the loading animation
            loadingIndicator.stopAnimating()
        }
    }
    
}

extension ReviewDetailVC: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start to load")
        showActivityIndicator(show: true)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finish to load")
        title = webView.title
        showActivityIndicator(show: false)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
        showActivityIndicator(show: false)
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
        showActivityIndicator(show: false)
    }
}
