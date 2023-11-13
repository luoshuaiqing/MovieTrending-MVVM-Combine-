//
//  MainViewController.swift
//  MovieTrending
//
//  Created by Shuaiqing Luo on 11/11/23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: IBOutlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: ViewModel
    
    var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    func configureView() {
        self.title = "Main View"
        setupTableView()
    }
    
}
