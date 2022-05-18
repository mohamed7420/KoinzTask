//
//  BaseAggragatedService.swift
//  KoinzTask
//
//  Created by Mohamed osama on 17/05/2022.
//

import Foundation
import RxSwift

class BaseAggregatedService: NSObject {
    let requestManager = RequestManager()
    let group = DispatchGroup()
    var errors: [AppError] = []
    var disposable: Disposable?
    var disposeBag: DisposeBag = DisposeBag()
    
    func start(completion:@escaping (Any?, _ error: [AppError]?) -> Void ){}
    
}
