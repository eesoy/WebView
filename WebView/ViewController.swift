//
//  ViewController.swift
//  WebView
//
//  Created by soyoung on 2017. 12. 9..
//  Copyright © 2017년 soyoung. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, UITextFieldDelegate, WKNavigationDelegate {

    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUrl.delegate = self
        webView.navigationDelegate = self
        // Do any additional setup after loading the view, typically from a nib.
        loading.isHidden = true
        
        //키패드 포커스
        txtUrl.becomeFirstResponder()
        
    }
    
    
    //return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return")
        webView.load(URLRequest(url: URL(string: "https://" + txtUrl.text!)!))
        return true
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("start")
        if(loading.isHidden){
            loading.isHidden = false
            loading.startAnimating()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("end")
        if(!loading.isHidden){
            loading.isHidden = true
        }
    }
    

    
    func goPageWithUrlString(urlString: String){
        //hasPrefix : String 앞쪽에 http가 포함되어 있는지
        if urlString.hasPrefix("http"){
            print("hasPrefix")
            webView.load(URLRequest(url: URL(string: urlString)!))
        }else {
            webView.load(URLRequest(url: URL(string: "https://" + urlString)!))
        }
        
        //키패드 내리기
        txtUrl.resignFirstResponder()
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
        goPageWithUrlString(urlString: "www.google.com")
    }
    
    @IBAction func btnHtml(_ sender: UIButton) {
        //큰 따옴표 세개 쓰면 안에 스트링값 맘대로 작성 가능
        let htmlString = """
                            <h1>HTML String</h1>
                            <p>Hello Swift</p>
                            <a href=\"http://www.apple.com\">Apple 홈페이지</a>
                            """
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    
    @IBAction func btnFile(_ sender: UIButton) {
        let path = Bundle.main.path(forResource: "emptyFile", ofType: "html")
        webView.loadFileURL(URL(fileURLWithPath: path!), allowingReadAccessTo: URL(fileURLWithPath: path!))
        //goPageWithUrlString(urlString: path!)
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

