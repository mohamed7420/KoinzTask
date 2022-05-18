//
//  BaseProtocols.swift
//  KoinzTask
//
//  Created by Mohamed osama on 17/05/2022.
//

import Foundation
import UIKit


protocol BaseViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func showScreenNoConnection()
    func showAlert(title: String?, message: String)
}
protocol BasePresenterProtocol: AnyObject {
    func handelGloaplError(_ error: AppError, view: BaseViewProtocol?)
}
