//
//  CustomViews.swift
//
//  Created by Mohamed osama on 23/01/2022.
//

import UIKit

@IBDesignable class CustomView: UIView{
    
    @IBInspectable var topRightCorner: CGFloat = 0.0{
        didSet{
            self.clipsToBounds = true
            self.layer.cornerRadius = topRightCorner
            self.layer.maskedCorners = [.layerMaxXMinYCorner]
        }
    }
    
    @IBInspectable var topLeftCorner: CGFloat = 0.0{
        didSet{
            self.clipsToBounds = true
            self.layer.cornerRadius = topLeftCorner
            self.layer.maskedCorners = [.layerMaxXMinYCorner , .layerMinXMinYCorner]
        }
    }

    @IBInspectable var shadowRadius: CGFloat = 0.0{
        didSet{
            self.layer.shadowRadius = shadowRadius
        
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .white{
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0{
        didSet{
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = .zero{
        didSet{
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0{
        didSet{
            self.layer.cornerRadius = cornerRadius
            //self.clipsToBounds = true
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0.0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = .white{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}


typealias TableViewDataSource = UITableViewDataSource & UITableViewDelegate

extension UITableView{
    func register<Cell: UITableViewCell>(cell: Cell.Type){
        let nibName: String = String(describing: cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func deque<Cell: UITableViewCell>() -> Cell{
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            return UITableViewCell() as! Cell
        }
        return cell
    }
}
