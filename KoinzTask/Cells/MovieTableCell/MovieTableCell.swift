//
//  MovieTableCell.swift
//  KoinzTask
//
//  Created by Mohamed osama on 18/05/2022.
//

import UIKit
import Kingfisher

class MovieTableCell: UITableViewCell, CellProtocol , CellViewProtocol{
   
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imagePhoto: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func set(farm: Int, server: String, id: String, secret: String) {
        let url = Constants.httpProtocol + "\(farm)" + Constants.host + server + "/\(id)_\(secret)\(Constants.ext)"
        guard let url = URL(string: url) else {return}
        print(url)
        imagePhoto.kf.setImage(with: url, placeholder: UIImage(named: "no_image_placeholder"))
    }

    func set(title: String) {
        lblTitle.text = title
    }
    

}
