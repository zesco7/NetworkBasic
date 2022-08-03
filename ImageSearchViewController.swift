//
//  ImageSearchViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/08/03.
//
/*
import UIKit

import Alamofire
import SwiftyJSON


class ImageSearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

 
    }
    /*
     -.엔드포인트 뒤에 커스텀으로 사용할 내용을 추가해준다.
     
     
     */
    
    
    
    
    //일반적으로 fetchImage, requestImage, callRequestImage, getImage 로 함수명 사용하는데 response에 따라 네이밍 결정
    //query는 한글인식 불가능하고 영어,숫자만 가능 : query=과자 -> query=snack(
    //콘솔창에 한글포함된 URL을 Insomnia프로그램으로 돌리면
    
    func callRequestImage() {
        //urlQueryAllowed: url링크로 사용하기 위해 쓰는 코드
        //let text = "과자".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        //"query=과자&display=30&start=1"에서 과자 -> \(text) 변경
        let url = EndPoint.imageSearchURL + "query=과자&display=30&start=1"
        let header: HTTPHeader = ["X-Naver-Client-Id": APIKey.NAVER.ID, "X-Naver-Client-Secret": APIKey.NAVER_SECRET]
        
        AF.request(url, method: .get, headers: header).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("JSON: \(json)")
            
                case .failure(let error):
                    print(error)
                }

}
*/
