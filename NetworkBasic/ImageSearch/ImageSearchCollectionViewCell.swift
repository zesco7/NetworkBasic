//
//  ImageSearchCollectionViewCell.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/08/06.
//

import UIKit

import Alamofire
import Kingfisher
import SwiftyJSON

class ImageSearchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var searchResultImageView: UIImageView!
    
    static let identifier = "ImageSearchCollectionViewCell"
    
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
                
                self.searchResultImageView.kf.setImage(with: URL(string: imageURL)!)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
