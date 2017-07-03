//
//
//  Created by Julia Friberg on 2017-04-05.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import Foundation
import WebKit

enum WebControllerUrl: String {
    case EventViewController = "https://rampen.co/start"
    case ScheduleViewController = "https://rampen.co/schedule"
    case TeamScheduleViewController = "https://rampen.co/scheduleteam"
}

class WebViewController: UIViewController, WKUIDelegate {
    var url: String = ""
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch (self.restorationIdentifier ?? "no id") {
        case "EventViewController":
            url = WebControllerUrl.EventViewController.rawValue
        case "ScheduleViewController":
            url = WebControllerUrl.ScheduleViewController.rawValue
        case "TeamScheduleViewController":
            url = WebControllerUrl.TeamScheduleViewController.rawValue
        default:
            url = "https://apple.com"
        }
        
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
}


