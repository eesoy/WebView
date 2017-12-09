//
//  ViewController.swift
//  WebView
//
//  Created by soyoung on 2017. 12. 9..
//  Copyright © 2017년 soyoung. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, UITextFieldDelegate {

    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUrl.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    //return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return")
        webView.load(URLRequest(url: URL(string: "https://" + txtUrl.text!)!))
        return true
    }

    
    func goPageWithUrlString(urlString: String){
        //hasPrefix : String 앞쪽에 http가 포함되어 있는지
        if urlString.hasPrefix("http"){
            print("hasPrefix")
            webView.load(URLRequest(url: URL(string: urlString)!))
        }else {
            webView.load(URLRequest(url: URL(string: "https://" + urlString)!))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        txtUrl.delegate = self
    }
    @IBAction func btnGo(_ sender: UIButton) {
        print("\(txtUrl.text!)")
        goPageWithUrlString(urlString: txtUrl.text!)
    }
    
    @IBAction func btnSite1(_ sender: UIButton) {
        goPageWithUrlString(urlString: "www.naver.com")
    }
    
    @IBAction func btnSite2(_ sender: UIButton) {
    }
    
    @IBAction func btnHtml(_ sender: UIButton) {
    }
    
    @IBAction func btnFile(_ sender: UIButton) {
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func btnGoback(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
}

