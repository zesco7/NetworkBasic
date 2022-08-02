//
//  SSearchViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/08/02.
//

import UIKit

class SSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else {
            return UITableViewCell() }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


}
