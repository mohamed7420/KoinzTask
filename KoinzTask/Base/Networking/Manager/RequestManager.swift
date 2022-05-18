//
//  RequestManager.swift
//  KoinzTask
//
//  Created by Mohamed osama on 17/05/2022.
//

import Foundation

import Foundation
import RxSwift

class RequestManager: APIClient {
        
    func getAllPhotos(model: MoviePhoto) -> Observable<MovieListResponse>{
        return request(FlikrAPI.getMoviePhotos(model: model))
    }

}
