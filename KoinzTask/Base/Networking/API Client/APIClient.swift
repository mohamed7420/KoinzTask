//
//  APIClient.swift
//  KoinzTask
//
//  Created by Mohamed osama on 17/05/2022.
//

import Foundation
import RxSwift
import Alamofire

class APIClient: NSObject{
    
    func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        var appError: AppError = AppError()
        //Create an RxSwift observable, which will be the one to call the request when subscribed to
        return Observable<T>.create { observer in
            //Trigger the HttpRequest using AlamoFire (AF)
            let request = AF.request(urlConvertible).responseDecodable { (response: DataResponse<T , AFError>) in
                //Check the result from Alamofire's response and check if it's a success or a failure
                switch response.result {
                case .success(let value):
                    //Everything is fine, return the value in onNext
                    print(value)
                    observer.onNext(value)
                    observer.onCompleted()
                    
                case .failure(let error):
                    if !(NetworkReachabilityManager()?.isReachable ?? true || response.response?.statusCode == nil)  {
                        print(error)
                        appError.errorCode = -1
                        appError.message = "No connections are available"
                        observer.onError(appError)
                    } else {
                        
                        appError.errorCode = response.response?.statusCode
                        appError.message = error.localizedDescription
                        observer.onError(appError)
                    }
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
   
}
