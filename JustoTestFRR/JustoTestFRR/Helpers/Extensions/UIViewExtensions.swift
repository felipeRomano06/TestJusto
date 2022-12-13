//
//  UIViewExtensions.swift
//  JustoTestFRR
//
//  Created by Felipe Romano on 13/12/22.
//

import Foundation
import UIKit

extension UIView{
    func addShadowAndCornerRadius(radius:CGFloat = 10, backView:UIView){
        self.layer.backgroundColor = UIColor.clear.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 4.0
        
        backView.layer.cornerRadius = radius
        backView.layer.masksToBounds = true
        
    }
}
