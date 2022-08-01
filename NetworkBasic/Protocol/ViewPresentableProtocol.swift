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

//optional은 선택적요청임(optional requirement)이므로 optional 함수를 사용하려면 @objc 붙여야함
//ex. optional func configureTextField() -> @objc optional func configureTextField()
//옵셔널함수가지고 있으면 프로토콜 앞에도 @objc써줘야함
//ex. protocol ViewPresentableProtocol -> @objc protocol ViewPresentableProtocol {

@objc protocol ViewPresentableProtocol {
    func configureView()
    func configureLabel()
    @objc optional func configureTextField()
    
    //프로토콜은 규약이자 필요한 요소를 명세만 할 뿐 실질적인 구현부는 프로토콜에 작성하지 않는다. 구현은 프로토콜을 채택,준수한 타입에서 구현한다.
    //클래스, 구조체, 열거형, 익스텐션에서 다 사용 가능하다.
    //클래스는 단일 상속만 가능하지만 프로토콜은 채택갯수에 제한 없음.
    
    //구현부에서 어떤걸 저장, 연산프로퍼티로 쓸지 프로토콜에서 명세하지 않음. 따라서 무조건 var로 선언해야함 :  let navigationTitle: String { get set }  ->  var navigationTitle: String { get set } 

    var navigationTitle: String { get set } //뷰컨트롤러에 네비게이션타이틀 적용하기 위한 코드
    var backgroundColor: UIColor { get } //뷰컨트롤러에 백그라운드컬러 적용하기 위한 코드
}

/*
 ex. 테이블뷰
 */

protocol AppleTableViewProtocol {
    
}

@objc protocol appleTableViewProtocol {
    func numberOfOewsInSection() -> Int
    func cellForRowAt(indexPath: IndexPath) -> UITableViewCell
    @objc optional func didSelectRowAt()
}

/*
 1. 프로토콜은 규약이다. 실질적인 구현은 채택한 곳에서 한다.
 2. 프로퍼티와 메서드에 대한 요구사항을 작성할 수 있다.
 3. 프로토콜은 선택적 요청을 할 수 있다.
*/
