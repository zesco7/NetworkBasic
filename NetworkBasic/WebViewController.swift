//
//  WebViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/07/28.
//
/*
import UIKit
import WebKit
class WebViewController: UIViewController, ReusableViewProtocol {
    //메타타입을 쓰면 문자열로 인식해줌. String(describing: WebViewController.self) 를 "WebViewController"로 인식
    static var reuseIdentifier: String = String(describing: WebViewController.self)
    

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
        func search
        
        extension WebViewController: UISearchBarDelegate {
            
            func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
                openWebPage(url: searchBar.text!)
            }
        }
    }
    
    }

*/
