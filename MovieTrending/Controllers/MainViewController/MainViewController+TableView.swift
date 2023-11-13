//
//  MainViewController+TableView.swift
//  MovieTrending
//
//  Created by Shuaiqing Luo on 11/13/23.
//

import UIKit

extension MainViewController: UITableViewDataSource {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
}

extension MainViewController: UITableViewDelegate {
    
}
