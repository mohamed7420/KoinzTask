//
//  BaseViewController.swift
//  KoinzTask
//
//  Created by Mohamed osama on 17/05/2022.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController, BaseViewProtocol, UIGestureRecognizerDelegate{
 
    @IBOutlet weak var backButton: UIButton?
    var refreshControl = UIRefreshControl()
    var loadingView: NVActivityIndicatorView?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadingView = NVActivityIndicatorView(frame: .zero)
        self.loadingView?.bringSubviewToFront(self.view)
        self.view.addSubview(loadingView!)
        self.loadingView?.setDimensions(width: 50, height: 50)
        self.loadingView?.centerX(inView: self.view)
        self.loadingView?.centerY(inView: self.view)
        self.loadingView?.type = .ballSpinFadeLoader
        self.loadingView?.color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.loadingView?.padding = 0

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }

 
    @IBAction func back(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    

    //MARK:- Loading and alerts
    func showLoading() {
        loadingView?.startAnimating()
    }
    
    func showAlert(title: String?, message: String) {
        let titleTxt = NSLocalizedString(title ?? "", comment: "")
        let messageTxt = NSLocalizedString(message, comment: "")
        let alertController = UIAlertController(title: titleTxt, message: messageTxt, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    func hideLoading() {
        loadingView?.stopAnimating()
        
    }
    
    func showScreenNoConnection() {

    }
}
