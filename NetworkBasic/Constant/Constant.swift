//
//  Constant.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/08/01.
//

import Foundation

struct APIKey {
    static let BOXOFFICE = "847feb80cdfbe381647688f09d9e9d22"
    static let NAVER_ID = "tfYqqDDQUPRUW3CIm5x4"
    static let NAVER_SECRET = "NAoG26YRAW"
}

//공통되는 부분까지 EndPoint로 작성
struct EndPoint {
    static let boxOfficeURL = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
    static let lottoURL = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber"
    static let translateURL = "https://openapi.naver.com/v1/papago/n2mt"
    static let imageURL = "https://openapi.naver.com/v1/search/image.json?"
}


//enum StoryboardName: String {
//    case Main
//    case search
//    case setting
//}

//struct StoryboardName {
//접근제어를 통해 초기화 방지할수 있음. 열거형이랑 효과 사실상 동일(인스턴스 사용불가): private init() {}
//    static let main = "Main"
//    static let search = "search"
//    static let setting = "setting"
//}

//열거형 내에서 타입프로퍼티를 사용할수도 있다.
//열거형은 인스턴스를 만들지 못하기 때문에 타입프로퍼티만 사용 가능하다.
enum StoryboardName {
    //var nickname = "고래밥" // 인스턴스 사용 못함.
        static let main = "Main"
        static let search = "search"
        static let setting = "setting"
    }
/*
 1. struct type property vs enum type property
 -> struct는 인스턴스 만들수 있고 enum은 인스턴스 생성 못함.//인스턴스대신 구조체사용하려고한건데 인스턴스 사용하면 메모리 비효율 생김.
 2. enum case, enum static 차이
 -> case는 raw value 중복안되고 static은 중복 가능
 */

enum FontName {
//    case title = "Sanfransico"
//    case body = "Sanfransico"
//    case caption = "Applesandol"
    
    static let title = "Sanfransico"
    static let body = "Sanfransico"
    static let caption = "Applesandol"
}
