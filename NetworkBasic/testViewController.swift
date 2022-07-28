//
//  testViewController.swift
//  NetworkBasic
//
//  Created by Mac Pro 15 on 2022/07/27.
//

import UIKit

class testViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var testTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: testTableViewCell.identifier, for: indexPath) as? testTableViewCell else { return UITableViewCell()}
        
        cell.secondTitleLabel.font = .systemFont(ofSize: 20)
        cell.secondTitleLabel.text = "HELLO"
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        testTableView.delegate = self
        testTableView.dataSource = self
        
//        testTableView.register(UINib(nibName: testTableview.identifier, bundle: nil)), 
        
        // Do any additional setup after loading the view.
    }
        
    

}
