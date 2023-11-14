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
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NWY1NDM3MDU1YjE0MmU2YTVjY2QxMzMxZmZlZGVmYyIsInN1YiI6IjY1NTI0NzQ0OTY1M2Y2MTNmODYyZDg3NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Xg-VXCpR2yWtNNNnUiExUP_j2bNtkWt1Svjy2zJxuws"
        ]
        let urlString = "https://api.themoviedb.org/3/search/movie?query=batman&language=en-US&page=1&year=2022"
        guard let url = URL(string: urlString) else { return completionHandler(.failure(.urlError))}
        
        let request = NSMutableURLRequest(url: url,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { dataResponse, urlResponse, error in
            if error == nil, let dataResponse = dataResponse, let resultData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: dataResponse) {
                return completionHandler(.success(resultData))
            } else {
                return completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
