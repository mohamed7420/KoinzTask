//
//  BannerTableViewCell.swift
//  KoinzTask
//
//  Created by Mohamed osama on 19/05/2022.
//

import UIKit

class BannerTableViewCell: UITableViewCell , CellBannerProtocol{
 
    @IBOutlet weak var imagePhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    func set(farm: Int, server: String, id: String, secret: String) {
        let url = Constants.httpProtocol + "\(farm)" + Constants.host + server + "/\(id)_\(secret)\(Constants.ext)"
        guard let url = URL(string: url) else {return}
        print(url)
        imagePhoto.kf.setImage(with: url, placeholder: UIImage(named: "no_image_placeholder"))
    }
    
}
