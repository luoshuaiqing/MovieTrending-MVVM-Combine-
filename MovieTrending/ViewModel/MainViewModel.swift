//
//  MainViewModel.swift
//  MovieTrending
//
//  Created by Shuaiqing Luo on 11/13/23.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var dataSource: TrendingMoviesModel?
    
    func numberOfSections() -> Int {
        1
    }

    func numberOfRows(in section: Int) -> Int {
        5
    }
    
    func getData() {
        guard !isLoading.value else { return }
        
        isLoading.value = true
        APICaller.getTrendingMovies { [weak self] result in
            guard let self = self else { return }
            self.isLoading.value = false
            switch result {
            case .success(let data):
                print("Top Trending Counts: \(data.results.count)")
                self.dataSource = data
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
