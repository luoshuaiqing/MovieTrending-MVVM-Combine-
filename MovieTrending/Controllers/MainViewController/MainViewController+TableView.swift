//
//  MainViewController+TableView.swift
//  MovieTrending
//
//  Created by Shuaiqing Luo on 11/13/23.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDataSource {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .clear
        
        registerCells()
    }
    
    func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let movie = cellDataSource[indexPath.row]
        cell.textLabel?.text = viewModel.getMovieTitle(movie)
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController {
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
