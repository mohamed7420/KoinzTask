//
//  MovieModel.swift
//  KoinzTask
//
//  Created by Mohamed osama on 18/05/2022.
//

import Foundation

enum StatusCases: String{
    case success = "ok"
    case fail = "fail"
}

struct MoviePhoto{
    let method: String
    let format: String
    let nojsoncallback: Int
    let text: String
    let page: Int
    let per_page: Int
    let api_key: String
}

struct MovieListResponse: Codable {
    var photos: Photos?
    var stat: String?
}

// MARK: - Photos
struct Photos: Codable {
    var page, pages, perpage, total: Int?
    var photo: [Photo]?
}

// MARK: - Photo
struct Photo: Codable {
    var id, owner, secret, server: String?
    var farm: Int?
    var title: String?
    var ispublic, isfriend, isfamily: Int?
}
