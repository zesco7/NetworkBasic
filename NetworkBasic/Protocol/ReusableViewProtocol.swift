//
//  ReusableViewProtocol.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/08/01.
//

import Foundation
import UIKit
protocol ReusableViewProtocol {
    static var reuseIdentifier: String { get }
}


//익스텐션은 저장프로퍼티를 사용하지 못해서 익스텐션 선언시 연산프로퍼티 형태로 나옴
//연산프로퍼티만 사용하면 get 생략가능 : get return String(describing: self) -> String(describing: self)
//익스텐션을 생성하면 다른컨트롤러 클래스에 붙인 ReusableViewProtocol 삭제하고 ViewDidLoad에 익스텐션 호출하면 identifier사용 가능(클래스에  ReusableViewProtocol 가만 두면 익스텐션이랑 중복되기 때문.

extension UIViewController: ReusableViewProtocol {
    
    static var reuseIdentifier: String {
            return String(describing: self)
    }
}

extension UITableViewCell: ReusableViewProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
