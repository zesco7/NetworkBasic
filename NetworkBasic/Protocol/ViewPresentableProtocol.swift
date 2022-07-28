//
//  ViewPresentableProtocol.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/07/28.
//

import Foundation
import UIKit

/*
 ~~protocol
 ~~delegate
 */

//@objc optional은 선택적요청임(optional requirement)
//옵셔널함수가지고 있으면 프로토콜 앞에도 @objc써줘야함
@objc protocol ViewPresentableProtocol {
    func configureView()
    func configureLabel()
    @objc optional func configureTextField()
    
    //프로토콜 프로퍼티,메서드 작성법
    //구현부에서 어떤걸 저장, 연산프로퍼티로 쓸지 프로토콜에서 명세하지 않음. 따라서 무조건 var로 선언해야함
    //get만 명시했어도 set구현 가능함. 단, get 기능이 최소한 구현되어있는 경우만 가능.
    var navigationTitle: String { get set }
    var backgroundColor: UIColor { get }
}

/*
 ex. 테이블뷰
 */

@objc protocol appleTableViewProtocol {
    func numberOfOewsInSection() -> Int
    func cellForRowAt(indexPath: IndexPath) -> UITableViewCell
    @objc optional func didSelectRowAt()
}
