//
//  BasePresenter.swift
//  KoinzTask
//
//  Created by Mohamed osama on 17/05/2022.
//

import Foundation
import RxSwift

class BasePresenter: BasePresenterProtocol {
    var disposable: Disposable?
    var disposeBag: DisposeBag
    var requestManager: RequestManager
    init() {
        disposeBag = DisposeBag()
        requestManager = RequestManager()
    }
    
    func handelGloaplError(_ error: AppError, view: BaseViewProtocol?) {
        
        switch error.errorType {
        case .noConnection :
            view?.showScreenNoConnection()
        case .unkown:
            view?.showAlert(title: nil, message: error.message ?? "")
        }
    }
    
    deinit {
        if self.disposable != nil {
            _ = DisposeBag(disposing: self.disposable!)
        }
        
    }
    
}
