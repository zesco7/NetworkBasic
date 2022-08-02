//
//  BeerRecommendationViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/08/01.
//

import UIKit
import Alamofire
import SwiftyJSON


/*
class BeerRecommendationViewController: UIViewController {

    
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var beerDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadBeerInfo()
    
    }
    
    func loadBeerInfo() {
        let URL = "https://api.punkapi.com/v2/beers/random"
        
        //AF: status code 중 200~299까지 성공이고 300이상 추가하려면 validate에 statusCode 추가해야함.
        //validate는 상태코드 처리관리함
        //어디에 요청할지 정해야 되므로 요청대상 url주소를 설정해줘야함.
        //AF.request(url, method: .get).validate(statusCode: 200..<400)는 알라모 파이어 관련 코드
        //responseJSON ~~는 responseJSON 관련 코드
        //접두어 최신버젼 Alamofire -> AF
        
        AF.request(URL, method: .get).validate(statusCode: 200..<400).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let beerimage = json["image_url"].stringValue
                print("beerImage")
                
                let beerName = json["name"].stringValue
                print(beerName)
                
                let beerDescription = json["description"].rawString()

                self.beerImage.image = beerImage
                self.beerName.text = beerName
                self.beerDescription.text = beerDescription
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
    @IBAction func recommendationButtonClicked(_ sender: UIButton) {
        loadBeerInfo()
    }
}

*/
