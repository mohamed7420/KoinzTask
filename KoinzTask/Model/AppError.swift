//
//  AppError.swift
//  YooGadBusiness
//
//  Created by Mohamed osama on 18/05/2022.
//

import Foundation

enum ErrorType {
    case noConnection
    case unkown
}

struct AppError: Error {
    var message :String?
    var errorType : ErrorType = .unkown
    var errorCode: Int! {
        willSet {
            switch newValue {
            case -1:
                self.errorType = .noConnection
            default:
                self.errorType = .unkown
            }
        }
    }
    
}
