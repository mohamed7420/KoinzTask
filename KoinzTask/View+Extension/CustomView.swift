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

extension UIView{
    func roundCorners(corners: UIRectCorner , radius: CGFloat){
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
