//
//  MainViewModel.swift
//  MovieTrending
//
//  Created by Shuaiqing Luo on 11/13/23.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var movieTableCellViewModels: Observable<[MovieTableCellViewModel]> = Observable([])
    var dataSource: TrendingMoviesModel?
    
    func numberOfSections() -> Int {
        1
    }

    func numberOfRows(in section: Int) -> Int {
        dataSource?.results.count ?? 0
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
                self.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        movie.title
    }
    
    func retrieveMovie(with id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: { $0.id == id }) else { return nil }
        return movie
    }
    
}

private extension MainViewModel {
    func mapCellData() {
        movieTableCellViewModels.value = dataSource?.results.compactMap({ movie in
            MovieTableCellViewModel(movie: movie)
        }) ?? []
    }
}
