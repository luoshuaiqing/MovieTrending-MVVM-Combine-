//
//  APICaller.swift
//  MovieTrending
//
//  Created by Shuaiqing Luo on 11/13/23.
//

import Foundation

public enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrendingMovies(
        completionHandler: @escaping(_ result: Result<TrendingMoviesModel, NetworkError>) -> Void
    ) {
        let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
        guard let url = URL(string: urlString) else { return completionHandler(.failure(.urlError))}
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil, let dataResponse = dataResponse, let resultData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: dataResponse) {
                return completionHandler(.success(resultData))
            } else {
                return completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
