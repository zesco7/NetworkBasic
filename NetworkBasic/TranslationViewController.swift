//
//  TranslationViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/07/28.
//

import UIKit

import Alamofire
import SwiftyJSON

//UIButton, UITextField : 액션연결 가능
//UITextView, UISearchBar, UIPickerView : 액션연결 불가
//UIControl
//UIResponderChain : resignFirstResponder, becomeFirstResponder

/*텍스트필드에 번역기능 추가하기
 -. API를 호출하기 위해 alamofire기능이 있는 key값이 매개변수인 request 함수를 생성한다.(func requestTranslation())
 
 
 
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

class TranslationViewController: UIViewController {
    
    @IBOutlet weak var userInputTextView: UITextView!
    @IBOutlet weak var translatedTextView: UITextView!
    
    let textViewplaceholderText = "번역하고싶은 문장을 써보세요"
    override func viewDidLoad() {
        super.viewDidLoad()

        userInputTextView.delegate = self
        userInputTextView.text = textViewplaceholderText
        userInputTextView.textColor = .lightGray
        userInputTextView.font = UIFont(name: "GmarketSansTTFBold", size: 20)
    
    }
    
    //링크안에 정보를 넣어놓는 것보다 안전하게 정보를 취급하기 위해 상수선언하여 딕셔너리형태 header를 사용한다.(네이버 참고사항 따라)
    //headers의 타입은 HTTPHeaders로 한다.
    //AF.request의 method를 post로 한다.
    //headers앞에 parameters를 추가하고 상수선언하여 parameter를 딕셔너리형태로 만들고 값을 추가한다.(네이버 참고사항 따라)
    //상태코드에 따라 json값이 달라질 수 있기 때문에 무조건 stringValue처럼 값을 가져올 수 없다. 그럴 때는 상태코드를 먼저 체크해주자.
    
    func requestTranslation(data: String) {
        let url = EndPoint.translateURL
        let header : HTTPHeaders = ["X-Naver-Client-Id": APIKey.NAVER_ID, "X-Naver-Client-Secret": APIKey.NAVER_SECRET]
        let parameter = ["source": "ko", "target": "en", "text": data]
        
        AF.request(url, method: .post, parameters: parameter, headers: header).validate(statusCode: 200..<400).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let translation = json["message"]["result"]["translatedText"].stringValue
                print(translation)
                
                self.translatedTextView.text = translation
                
                /*
                let statusCode = response.response?.statusCode ?? 500 //nil값이거나 문제가 생길때는 서버오류라는 것을 보여줄수있다.
                statusCode가 많은 경우는 switch구문을 쓸 수 있고 값이 두개면 if-else로 처리 가능하다.
                if statusCode == 200 {
                 } else {
                 self.userInputTextView.text = json["errormessage"].stringValue
                */
                
                self.translatedTextView.delegate = self
                self.translatedTextView.textColor = .lightGray
                self.translatedTextView.font = UIFont(name: "GmarketSansTTFBold", size: 20)
               
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @IBAction func translationButton(_ sender: UIButton) {
        requestTranslation(data: userInputTextView.text!)
    }
    
    
}

extension TranslationViewController: UITextViewDelegate {
    
    //텍스트뷰의 텍스트가 변할 때마다 호출
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text.count)
    }
    
    //편집이 시작될때. 커서가 시작될때
    //텍스트뷰 글자: 플레이스홀더랑 같으면 clear, 글자색변경
    func textViewDidBeginEditing(_ textView: UITextView) {
         print("Begin")
        
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    //편집이 끝났을때. 커서가 없어진 순간.
    //텍스트뷰 글자: 사용자가 아무글자 안썼으면 플레이스홀더 글자 보이게 해라
    func textViewDidEndEditing(_ textView: UITextView) {
        print("End")
        
        if textView.text.isEmpty {
            textView.text = textViewplaceholderText
            textView.textColor = .lightGray
        }
    }
}
