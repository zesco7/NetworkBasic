//
//  TranslationViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/07/28.
//

import UIKit

//UIButton, UITextField : 액션연결 가능
//UITextView, UISearchBar, UIPickerView : 액션연결 불가
//UIControl
//UIResponderChain : resignFirstResponder, becomeFirstResponder

class TranslationViewController: UIViewController {
    
    @IBOutlet weak var userInputTextView: UITextView!

    let textViewplaceholderText = "번역하고싶은 문장을 써보세요"
    override func viewDidLoad() {
        super.viewDidLoad()

        userInputTextView.delegate = self
        userInputTextView.text = textViewplaceholderText
        userInputTextView.textColor = .lightGray
        
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
