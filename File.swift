//
//  File.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/08/01.
//

import Foundation
import UIKit

extension UILabel {
    
    func setBorder() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.layer.cornerRadius = 30
    }
}

