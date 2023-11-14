//
//  MovieTableCellViewModel.swift
//  MovieTrending
//
//  Created by Shuaiqing Luo on 11/14/23.
//

import Foundation

class MovieTableCellViewModel {
    
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    
    init(movie: Movie) {
        id = movie.id
        title = movie.title
        date = movie.releaseDate
        rating = "\(movie.voteAverage)/10"
        imageUrl = makeImageUrl(movie.posterPath)
    }
    
    private func makeImageUrl(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
