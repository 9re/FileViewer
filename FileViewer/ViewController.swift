//
//  ViewController.swift
//  FileViewer
//
//  Created by Taro Kobayashi on 05/03/2015.
//  Copyright (c) 2015 Taro Kobayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak private var webview: UIWebView!
    @IBOutlet weak private var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
  
        NSURLCache.sharedURLCache().removeAllCachedResponses()
        let url = NSURL(string: "http://test.uwvm.mn/filetest.html")
        webview.delegate = self
        webview.loadRequest(NSURLRequest(URL: url!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        textView.text = webview.request!.URL.absoluteString;
    }
    
    @IBAction func onBackPressed(sender: AnyObject) {
        webview.goBack()
    }
}

