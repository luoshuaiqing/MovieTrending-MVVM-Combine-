//
//  MainViewController.swift
//  MovieTrending
//
//  Created by Shuaiqing Luo on 11/11/23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - ViewModel
    
    var viewModel: MainViewModel = MainViewModel()
    var movieTableCellViewModels: [MovieTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getData()
    }
    
    func configureView() {
        self.title = "Main View"
        setupTableView()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.movieTableCellViewModels.bind { [weak self] movieTableCellViewModels in
            guard let self = self else { return }
            self.movieTableCellViewModels = movieTableCellViewModels
            self.reloadTableView()
        }
    }
    
}
