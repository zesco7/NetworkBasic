//
//  WebViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/07/28.
//
/*
import UIKit
import WebKit
class WebViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webKit: WKWebView!
    @IBOutlet weak var toolBar: UIToolbar!
    
    var destinationURL : String = "https://www.apple.com"
    //App Transport Security Settings : http는 안열리고 https만 열림
    override func viewDidLoad() {
        super.viewDidLoad()

        openWebPage(url: destinationURL)
        searchBar.delegate = self
    }
    
    func openWebPage(url: String) {
        
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        webKit.load(request)
    }
    
    extension WebViewController: UISearchBarDelegate {
        
        func u
    }
    
    }
*/
