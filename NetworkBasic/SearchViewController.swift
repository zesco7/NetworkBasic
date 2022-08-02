//
//  SearchViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/07/27.
//

import UIKit

import Alamofire
import SwiftyJSON


/*
 Swift Protocol
 -. Delegate
 -. Datasource
 
 1. 왼팔/오른팔
 */

/*
-. 테이블뷰컨트롤러가 아닌 뷰컨트롤러에서 테이블뷰 함수를 사용하려면 테이블뷰 프로토콜을 선언해야 한다.
-. 테이블뷰 필수함수를 선언해야 한다.
-. 테이블뷰가 사용할 테이블뷰셀(XIB)을 등록해야 한다.(XIB: Xml Interface Builder (예전에는 NIB))
-. 뷰컨트롤러 배경색과 테이블뷰 배경색을 맞추려면 테이블뷰 배경색을 .clear로 처리한다.
 */


class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var searchTableView: UITableView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(UINib(nibName: ListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier:  ListTableViewCell.identifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        cell.titleLabel.textAlignment = .center
        cell.titleLabel.text = "HELLO"
        //cell.backgroundColor = .clear
    
        return cell
    }
}


/*
    

    var list: [String] = []
    //var list: [BoxOfficeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //연결고리 작업 : 테이블뷰가 해야할 역할 > 뷰컨트롤러에게 요청
//        searchTableView.delegate = self
//        searchTableView.dataSource = self
//
        //테이블뷰가 사용할 테이블뷰셀(XIB)등록
        //XIB: Xml Interface Builder (예전에는 NIB)
        searchTableView.register(UINib(nibName: ListTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ListTableViewCell.identifier)
        
        requestBoxoiffce(text: "20220801")
        
    }
    
    func requestBoxoiffce(text: String) {
        //인증키 횟수제한있고 사이트마다 다름. 제한범위 넘어가면 서버통신 실패하는 구조키당 3000회.
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=847feb80cdfbe381647688f09d9e9d22&targetDt=\(text)"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let movieNm1 = json["boxOfficeResult"]["boxOfficeResult"][0]["boxOfficeResult"]
                let movieNm2 = json["boxOfficeResult"]["boxOfficeResult"][1]["boxOfficeResult"]
                let movieNm3 = json["boxOfficeResult"]["boxOfficeResult"][2]["boxOfficeResult"]
                
                //list배열에 데이터 추가
                self.list.append(movieNm1)
                self.list.append(movieNm2)
                self.list.append(movieNm3)
                
                
                for movie in json["boxOfficeResult"]["boxOfficeResult"].arrayValue {
                    
                    let movieNm = movie["movieNm"].stringValue
                    let openDt = movie["openDt"].stringValue
                    let audiAcc = movie["audiAcc"].stringValue
                    
                    let data = BoxOfficeModel(movieTitle: movieNm, releaseDate: openDt, toalCount: audiAcc)
                    self.list.append(data)
                }
                
                
                
                
                
                //테이블뷰 갱신
                self.searchTableView.reloadData()
                
                print(self.list)
                
            case .failure(let error):
                print(error)
            }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        //return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        cell.titleLabel.text = "HELLO"
        //cell.titleLabel.text = list[indexPath.row]
        //cell.titleLabel.text = "\(list[indexPath.row].movieTitle): \(list[indexPath.row].movieTitle)"
        
        return cell
    }
}

    extension SearchViewController: UISearchBarDelegate {
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            requestBoxoiffce(url: searchBar.text!)

    }
*/
