//
//  UserDefaultsHelper.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/08/01.
//

import Foundation

class UserDefaultsHelper {
    
    static let standard = UserDefaultsHelper() // 내가 만든 싱글톤 패턴
    //일반적으로 UserDefaults.standard.set 형식으로 쓰는데  UserDefaults.standard.구문 중복 줄이기 위해 변수 선언
    //싱글톤 패턴(자기자신의 인스턴스를 타입프로퍼티 형태로 가지고 있음)
    let userDefaults = UserDefaults.standard //애플이 제공하는 싱글톤 패턴
    
    enum Key: String {
        case nickname, age
    }
    
    
    var nickname: String {
        get {
            return userDefaults.string(forKey: Key.nickname.rawValue) ?? "대장" // 이 코드를 줄이기 위해 연산프로퍼티 사용.
        }
        set { //연산 프로퍼티 parameter
            userDefaults.set(newValue, forKey: Key.nickname.rawValue)
        }
    }
    
    var age: Int {
        get {
            return userDefaults.integer(forKey: Key.age.rawValue) //Int,Bool은 기본값이 디폴트 0이라 옵셔널로 인한 에러를 ??처럼 예외처리 안해줘도 됨
        }
        set {
            userDefaults.set(newValue, forKey: Key.age.rawValue)
        }
    }
}
