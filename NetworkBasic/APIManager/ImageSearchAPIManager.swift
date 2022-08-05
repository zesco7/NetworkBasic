//
//  ImageSearchAPIManager.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/08/05.
//

import Foundation


//구조체는 싱글턴 패턴 사용하는게 안좋음. 클래스만 좋음
//ImageSearchViewController에서 사용했던 alamofire swiftyjason을 fetchImageData()에 구현함.
class ImageSearchAPIManager {
    static let shared = ImageSearchAPIManager()
    
    func fetchImageData() {
        
    }
}
