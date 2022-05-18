//
//  MovieListPresenter.swift
//  KoinzTask
//
//  Created by Mohamed osama on 18/05/2022.
//

import Foundation


class MovieListPresenter: BasePresenter{
    
    weak var view: MovieListViewProtocol?
    
    init(view: MovieListViewProtocol) {
        self.view = view
    }
}

extension MovieListPresenter: MovieListPresenterProtocol{
    
    func getAllPhotos(model: MoviePhoto) {
        self.view?.showLoading()
        self.disposable = requestManager.getAllPhotos(model: model).subscribe(onNext: { response in
            self.view?.hideLoading()
            
            
            
        }, onError: {[weak self] error in
            guard let self = self else {return}
            self.view?.hideLoading()
            if let error = error as? AppError{
                self.handelGloaplError(error, view: self.view)
            }
        }, onCompleted: nil, onDisposed: nil)
    }
    
    
    
    
}
