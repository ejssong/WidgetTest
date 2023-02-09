//
//  ViewController.swift
//  SampleProject
//
//  Created by ejsong on 2023/02/09.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebPage("https://www.naver.com/")
        NotificationCenter.default.addObserver(self, selector: #selector(getWidgetLink), name: .getWidgetLink, object: nil)
    }
    
    func loadWebPage(_ url: String) {
        let url = URL(string: url)
        let request = URLRequest(url: url!)
        DispatchQueue.main.async {
            self.webView.load(request)
        }
    }
    
    @objc func getWidgetLink(_ notificaiton: NSNotification) {
        if let path = notificaiton.userInfo?["path"] {
            loadWebPage("https://\(path).naver.com")
        }
    }
}

