//
//  DetailsMovieViewModel.swift
//  MovieTrending
//
//  Created by Shuaiqing Luo on 11/14/23.
//

import Foundation

class DetailsMovieViewModel {
    
    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieID: Int
    
    init(movie: Movie) {
        self.movie = movie
        self.movieID = movie.id
        self.movieTitle = movie.title
        self.movieDescription = movie.overview
        self.movieImage = makeImageUrl(movie.backdropPath ?? "")
    }
    
    private func makeImageUrl(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
