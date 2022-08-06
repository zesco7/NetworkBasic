//
//  ImageSearchViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/08/03.
//

import UIKit

import Alamofire
import SwiftyJSON


class ImageSearchViewController: UIViewController {
    @IBOutlet weak var collectionViewResult: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewResult.delegate = self
        collectionViewResult.dataSource = self
        
        collectionViewResult.register(UINib(nibName: ImageSearchCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImageSearchCollectionViewCell.identifier)
 
        fetchRequest()
    }
    
    /*이미지요청 함수 만들기(imageRequest)
     -. url상수에 필요한 요청변수를 추가한다.(필수, 옵션 : "query=과자&display=30&start=1")
     -. AF.request method는 get으로 한다.(이미지데이터를 받아와야하기 때문)
     -. query값은 영어로 요청한다.(한글로 요청하면 에러날 수 있음: invalidURL)
     -. query값 한글을 인식하려면 코드로 처리를 해줘야한다.(addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
     -. 웹이나 인섬니아에서 json값이 보이는건 내부적으로 처리를 해주었기 때문) (*인섬니아에서 확인시 header값 입력 필요)
     -. 사용자가 display된 검색결과를 끝까지 다 보면 start 넘버가 바뀌어야함(그래야 다음페이지에 있는 검색결과 보여줄수있음) (start=1 -> start=31) 
     */
    func fetchRequest() {
        
        let text = "과자".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = EndPoint.imageURL + "query=\(text)&display=30&start=1"
        let header: HTTPHeaders = ["X-Naver-Client-Id": APIKey.NAVER_ID, "X-Naver-Client-Secret": APIKey.NAVER_SECRET]
        
        AF.request(url, method: .get, headers: header).validate(statusCode: 200..<400).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let imageURL = json["items"][0]["link"].stringValue
                print(imageURL)
                
                self.imageURL.kf.setImage(with: URL(string: imageURL)!)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ImageSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSearchCollectionViewCell.identifier, for: indexPath) as? ImageSearchCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
            
        }
        
    }
    

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



/*0805
 json["item"].arrayValue
 json["item"].arrayValue.map { $0["link"].stringValue} // 받아온 api 값 중 link만 stringValue로 뽑겠다.
 
 
 
 */


