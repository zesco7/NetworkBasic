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

/*테이블뷰셀에 레이블표시하기
-. 테이블뷰컨트롤러가 아닌 뷰컨트롤러에서 테이블뷰 함수를 사용하려면 테이블뷰 프로토콜을 선언해야 한다.
-. 테이블뷰 필수함수를 선언해야 한다.
-. 테이블뷰가 사용할 테이블뷰셀(XIB)을 등록해야 한다.(XIB: Xml Interface Builder (예전에는 NIB))
-. 뷰컨트롤러 배경색과 테이블뷰 배경색을 맞추려면 테이블뷰 배경색을 .clear로 처리한다.
 */

/*써치바에 주소표시하기
 -. API를 호출하기 위해 alamofire기능이 있는 key값이 매개변수인 request 함수를 생성한다.
 -. 써치바에 입력된 주소를 불러오는 기능을 추가하기 위해 extension을 생성한다.
 -. 델리게이트를 연결해준다. (searchBar.delegate = self)
 -. 배열인덱스로 받아오는 movieNm값을 빈배열에 넣어준다.(self.list.append(movieNm1))
 -. 배열값을 테이블셀에 넣어준다.(배열인덱스 활용)
 -. 테이블뷰 배열이 달라진 경우 데이터 reload를 해줘야한다.(self.searchTableView.reloadData())
 -. 영화별 검색처럼 서버의 응답이 몇개 인지 모르는 경우는 반복문으로 키워드를 검색해서 결과값을 표시한다.
 -. 결과값을 누적해서 표시하지 않으려면 기존 배열을 삭제해주는 작업을 해야한다.(list.removeAll())
 -. 검색시 이전배열 데이터가 남아있는 것은 테이블뷰를 갱신해주지 않아서 그렇다.(테이블뷰 갱신해주면 사라짐)
 -. 전체 데이터가 아닌 필요한 데이터만 표시하기 위해서는 구조체에 필요한 변수를 선언한다.(BoxOfficeModel)
 */

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    var list: [BoxOfficeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(UINib(nibName: ListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier:  ListTableViewCell.identifier)
        
        requestBoxOffice(text: "20220801")
        searchBar.delegate = self
    }

    func requestBoxOffice(text: String) {
        //AF: status code 중 200~299까지 성공이고 300이상 추가하려면 validate에 statusCode 추가해야함.
        //validate는 상태코드 처리관리함
        //어디에 요청할지 정해야 되므로 요청대상 url주소를 설정해줘야함.
        //AF.request(url, method: .get).validate(statusCode: 200..<400)는 알라모 파이어 관련 코드
        //responseJSON ~~는 responseJSON 관련 코드
        //접두어 최신버젼 Alamofire -> AF
        
        list.removeAll()
        
        //구조체로 중복되는 부분을 접근할 수 있다.(APIKey, EndPoint) : 구조체로 접근하지 않으면 버젼관리 한 것을 다른사람이 봤을때 키값에 대한 정보를 알 수 없기 때문에 구조체로 접근하는 것이 좋음.
        let url = "\(EndPoint.boxOfficeURL)key=\(APIKey.BOXOFFICE)&targetDt=\(text)"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for movie in json["boxOfficeResult"]["dailyBoxOfficeList"].arrayValue {
                    let movieNm = movie["movieNm"].stringValue
                    let openDt = movie["openDt"].stringValue
                    let audiAcc = movie["audiAcc"].stringValue
                    
                    let data = BoxOfficeModel(movieTitle: movieNm, releaseDate: openDt, toalCount: audiAcc)
                    
                    
                    self.list.append(data)
                }
                print(self.list)
                        
//                let movieNm1 = json["boxOfficeResult"]["dailyBoxOfficeList"][0]["movieNm"].stringValue
//                let movieNm2 = json["boxOfficeResult"]["dailyBoxOfficeList"][1]["movieNm"].stringValue
//                let movieNm3 = json["boxOfficeResult"]["dailyBoxOfficeList"][2]["movieNm"].stringValue
//
//                self.list.append(movieNm1)
//                self.list.append(movieNm2)
//                self.list.append(movieNm3)
                
                self.searchTableView.reloadData()
                
                print(self.list)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        cell.titleLabel.textAlignment = .center
        cell.titleLabel.text = "\(list[indexPath.row].movieTitle): \(list[indexPath.row].releaseDate)"
        //cell.backgroundColor = .clear
    
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        requestBoxOffice(text: searchBar.text!)
    }
}
/*
    

    var list: [String] = []
    //var list: [BoxOfficeModel] = []
 
    //타입 어노테이션, 타입 추론 중 누가 더 속도가 빠를까?
    //var nickname: string = ""
    //var username = ""
 
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //연결고리 작업 : 테이블뷰가 해야할 역할 > 뷰컨트롤러에게 요청
//        searchTableView.delegate = self
//        searchTableView.dataSource = self
//
        //테이블뷰가 사용할 테이블뷰셀(XIB)등록
        //XIB: Xml Interface Builder (예전에는 NIB)
        searchTableView.register(UINib(nibName: ListTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ListTableViewCell.identifier)
        
 
 023수업
 Date, DateFormatter Calendar 차이 확인
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd" // TMI "yyyyMMdd" "YYYYMMdd"
        //let dateResult = Date(timeIntervalSinceNow: -84600)
        let yesterday = Calendar.current.date)(byAdding: .day, value: 4,to: Date()) // value 날짜기준 차이 양수일때 n일 후
        //let dateResult = format.string(from: yesterday!)
 
    네트워크 통신: 서버점검 등에 대한 예외 처리
    네트워크가 느린환경에서 테스트 해봐야함(실기기 테스트 시 condition 조절가능, 시뮬레이터도 가능(추가설치필요))
 
 
 
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
