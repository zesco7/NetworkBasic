//
//  LottoViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/07/28.
//

import UIKit

import Alamofire
import SwiftyJSON

class LottoViewController: UIViewController {
  
    

    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var luckyNumber1: UILabel!
    @IBOutlet weak var luckyNumber2: UILabel!
    @IBOutlet weak var luckyNumber3: UILabel!
    @IBOutlet weak var luckyNumber4: UILabel!
    @IBOutlet weak var luckyNumber5: UILabel!
    @IBOutlet weak var luckyNumber6: UILabel!
    @IBOutlet weak var bonusNumber: UILabel!
    
    var lottoPickerView = UIPickerView()
    
    let numberList: [Int] = Array(1...1025).reversed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        luckyNumber1.setBorder()
        luckyNumber2.setBorder()
        luckyNumber3.setBorder()
        luckyNumber4.setBorder()
        luckyNumber5.setBorder()
        luckyNumber6.setBorder()
        bonusNumber.setBorder()
        
        numberTextField.inputView = lottoPickerView
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
        
        requestLotto(number: 1025)
        
    }
    
    //로또API호출 메서드 생성
    func requestLotto(number: Int) {
        //AF: status code 중 200~299까지 성공이고 300이상 추가하려면 validate에 statusCode 추가해야함.
        //validate는 상태코드 처리관리함
        //어디에 요청할지 정해야 되므로 요청대상 url주소를 설정해줘야함.
        //AF.request(url, method: .get).validate(statusCode: 200..<400)는 알라모 파이어 관련 코드
        //responseJSON ~~는 responseJSON 관련 코드
        //접두어 최신버젼 Alamofire -> AF
        
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        AF.request(url, method: .get).validate(statusCode: 200..<400).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let luckyNumber1 = json["drwtNo1"].stringValue
                print(luckyNumber1)
                
                let luckyNumber2 = json["drwtNo2"].stringValue
                print(luckyNumber2)
                
                let luckyNumber3 = json["drwtNo3"].stringValue
                print(luckyNumber3)
                
                let luckyNumber4 = json["drwtNo4"].stringValue
                print(luckyNumber4)
                
                let luckyNumber5 = json["drwtNo5"].stringValue
                print(luckyNumber5)
                
                let luckyNumber6 = json["drwtNo6"].stringValue
                print(luckyNumber6)
                
                let bonusNumber = json["bnusNo"].stringValue
                print(bonusNumber)
                
                let date = json["drwNoDate"].stringValue
                print(date)
                
                self.numberTextField.text = date
                self.luckyNumber1.text = luckyNumber1
                self.luckyNumber1.setBorder()
                self.luckyNumber2.text = luckyNumber2
                self.luckyNumber3.text = luckyNumber3
                self.luckyNumber4.text = luckyNumber4
                self.luckyNumber5.text = luckyNumber5
                self.luckyNumber6.text = luckyNumber6
                self.bonusNumber.text = bonusNumber
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
    extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return numberList.count
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            requestLotto(number: numberList[row])
            //numberTextField.text = "\(numberList[row])회차"
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return "\(numberList[row])회차"
        }
        
}
