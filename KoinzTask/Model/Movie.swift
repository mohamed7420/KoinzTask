//
//  MovieModel.swift
//  KoinzTask
//
//  Created by Mohamed osama on 18/05/2022.
//

import Foundation

struct Movie: Decodable{
    
    static func fetchAllMovies() -> [Movie]{
       var movies = [Movie]()
        for _ in 0..<20{
            movies.append(Movie())
        }
        return movies
    }
}
