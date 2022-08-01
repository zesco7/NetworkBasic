//
//  ViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/07/27.
//
/*
import UIKit

class ViewController: UIViewController, ViewPresentableProtocol {
    var navigationTitle: String = "대장님의 다마고치"
    
    var backgroundColor: UIColor = .blue // set인 경우 let은 불가
    
    func configureView() {
        
        navigationTitle = "고래밥의 다마고치"
        backgroundColor = .red     //get만 명시했어도 set구현 가능함. 단, get 기능이 최소한 구현되어있는 경우만 가능.
        
        title = navigationTitle
        view.backgroundColor = backgroundColor
    }
    
    func configureLabel() {
        <#code#>
    }
    
    let helper = UserDefaultsHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //helper.nickname = "고래밥"
        //UserDefaultsHelper.standard.nickname = "고래밥"
        title = helper.nickname
        
        UserDefaultsHelper.standard.age = 80
        //helper.age = 80
        
        print(helper.age)
    }


}

*/
