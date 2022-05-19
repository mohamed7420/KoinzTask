//
//  PhotoFullScreenViewController.swift
//  KoinzTask
//
//  Created by Mohamed osama on 19/05/2022.
//

import UIKit

class PhotoFullScreenViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
        
    private func updateUI(){
        if let image = image{
            self.photoImageView.image = image
        }else{
            self.photoImageView.image = UIImage(named: "no_image_placeholder")
        }
    }

}
