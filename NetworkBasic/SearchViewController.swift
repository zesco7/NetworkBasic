//
//  SearchViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/07/27.
//

import UIKit

/*
 Swift Protocol
 -. Delegate
 -. Datasource
 
 1. 왼팔/오른팔
 2.
 */



class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var searchTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //연결고리 작업 : 테이블뷰가 해야할 역할 > 뷰컨트롤러에게 요청
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        //테이블뷰가 사용할 테이블뷰셀(XIB)등록
        //XIB: Xml Interface Builder (예전에는 NIB)
        searchTableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: ListTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        cell.titleLabel.text = "HELLO"
        
        return cell
    }
}
