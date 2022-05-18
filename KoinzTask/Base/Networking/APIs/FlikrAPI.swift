//
//  PhotoAPI.swift
//  KoinzTask
//
//  Created by Mohamed osama on 17/05/2022.
//

import Alamofire
import Foundation

enum FlikrAPI{
    case getMoviePhotos(model: MoviePhoto)
}

extension FlikrAPI: TargetType{

    var baseURL: String{
        switch self{
        case .getMoviePhotos(let model):
            return Constants.base_url + "?method=\(model.method)&format=\(model.format)&nojsoncallback=\(model.nojsoncallback)&text=\(model.text)&page=\(model.page)&per_page=\(model.per_page)&api_key=\(model.api_key)"
        }
    }
    
    var path: String {
        return ""
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var headers: [String : String]? {
        return [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
    
    var auth: [String : String]? {
        return nil
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
}
