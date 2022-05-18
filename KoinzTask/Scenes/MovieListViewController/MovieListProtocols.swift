//
//  MovieListProtocols.swift
//  KoinzTask
//
//  Created by Mohamed osama on 18/05/2022.
//

import Foundation


protocol MovieListViewProtocol: BaseViewProtocol{
    var presenter: MovieListPresenterProtocol?{get set}
    func set(photos: [Photo])
    func refresh()
}

protocol MovieListPresenterProtocol: BasePresenterProtocol{
    var view: MovieListViewProtocol?{get set}
    func getAllPhotos(model: MoviePhoto)
    func configureCellView(cell: CellViewProtocol , for index: Int)
}

protocol CellViewProtocol{
    func set(farm: Int ,server: String ,id: String ,secret:String)
    func set(title: String)
}
