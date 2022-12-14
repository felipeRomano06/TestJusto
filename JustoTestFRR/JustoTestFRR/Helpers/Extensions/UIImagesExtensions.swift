//
//  UIImagesExtensions.swift
//  JustoTestFRR
//
//  Created by Felipe Romano on 12/12/22.
//

import Foundation
import UIKit

extension UIImageView{
    
    func downloadImage(url: String){
        
        DispatchQueue.main.async {
            RequestManager.getImage(url: url, completion: {
                data, code in
                if code == nil {
                    if let imageData = data{
                        self.image = UIImage(data: imageData)
                    }else{
                        self.image = UIImage(named: "no-pictures")
                    }
                }else {
                    self.image = UIImage(named: "no-pictures")
                }
            })
        }
        
    }
}
