//
//  ShipCollectionViewCell.swift
//  JustoTestFRR
//
//  Created by Felipe Romano on 12/12/22.
//

import UIKit

class ShipCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var shipImage: UIImageView!
    @IBOutlet weak var shipName: UILabel!
    @IBOutlet weak var shipType: UILabel!
    
    private var shadowLayer: CAShapeLayer!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.styleCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        self.shipImage.image = UIImage(named: "no-pictures")
        self.shipName.text = ""
        self.shipType.text = ""
    }
    
    private func styleCell(){
        self.addShadowAndCornerRadius(radius: 10, backView: self.backView)
    }
    
    func config(ship:ShipsModelElement){
        
        self.shipName.text = ship.ship_name
        self.shipType.text = ship.ship_type
        
        if let imageURL = ship.image {
            self.shipImage.downloadImage(url: imageURL)
        }
        
    }

}
