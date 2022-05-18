//
//  MovieListProtocols.swift
//  KoinzTask
//
//  Created by Mohamed osama on 18/05/2022.
//

import Foundation


protocol MovieListViewProtocol: BaseViewProtocol{
    var presenter: MovieListPresenterProtocol?{get set}
    func refresh()
}

protocol MovieListPresenterProtocol: BasePresenterProtocol{
    var view: MovieListViewProtocol?{get set}
    func getAllPhotos(model: MoviePhoto)
}
