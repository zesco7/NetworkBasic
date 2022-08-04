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

import UIKit


/* 024
 //페이지네이션 방법1. 컬렉션뷰가 특정셀을 그리려는 시점에 호출되는 메서드.
 //마지막 셀에 사용자가 위치해있는지 명확하게 확인하기 어려움
 func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
     
 }
 
 //페이지네이션 방법2.
 //테이블뷰,컬렉션뷰 스크롤뷰를 상속받고 있어서 스크롤뷰 프로토콜을 사용할 수 있음
 func scrollViewDidScroll(_ scrollView: UIScrollView) {
 print(scrolView.contentOffset)
 }
 
//페이지네이션 방법3.
//용량이 큰 이미지를 다운받아 셀에 표시할때 효과적
//셀이 화면에 보이기 전에 미리 필요한 리소스를 다운받을 수도 있고 필요하지 않다면 데이터를 취소할 수 도 있음
//iOS10이상이면 스크롤성능 향상됨
//viewDidLoad에 datasource연결해줘야함.
 extension ImageSearchViewController: UICollectionViewDataSourcePrefetching {
 
    //셀이 화면에 보이기 직전에 필요한 리소스를 미리 다운 받는 기능
     func collectionView(_ collectionView: UICollectionView, prefetchItemAt indexPaths: [IndexPath]) {
         print("===\(indexPaths)")
     }
 //취소
 func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemAt indexPaths: [IndexPath]) {
     print("===\(indexPaths)")
 }

 
 */

