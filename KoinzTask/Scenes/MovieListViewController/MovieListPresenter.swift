//
//  MovieListPresenter.swift
//  KoinzTask
//
//  Created by Mohamed osama on 18/05/2022.
//

import Foundation


class MovieListPresenter: BasePresenter{
    
    weak var view: MovieListViewProtocol?
    private var items = [Photo]()
    
    init(view: MovieListViewProtocol) {
        self.view = view
    }
}

extension MovieListPresenter: MovieListPresenterProtocol{
    
    func getAllPhotos(model: MoviePhoto) {
        self.view?.showLoading()
        self.disposable = requestManager.getAllPhotos(model: model).subscribe(onNext: { response in
            self.view?.hideLoading()
            if response.stat == StatusCases.success.rawValue{
                DispatchQueue.main.async {
                    if let photos = response.photos?.photo{
                        if photos.count > 0{
                            self.view?.set(photos: photos)
                        }else{
                            self.view?.set(photos: [])
                        }
                        self.items = photos
                        self.view?.refresh()
                    }
                }
            }
            
        }, onError: {[weak self] error in
            guard let self = self else {return}
            self.view?.hideLoading()
            if let error = error as? AppError{
                self.handelGloaplError(error, view: self.view)
            }
        }, onCompleted: nil, onDisposed: nil)
    }
    
    
    func configureCellView(cell: CellViewProtocol , for index: Int){
        let item = items[index]
        cell.set(title: item.title ?? "No title found")
        cell.set(farm: item.farm ?? -1, server: item.server ?? "", id: item.id ?? "", secret: item.secret ?? "")
    }
    
}
