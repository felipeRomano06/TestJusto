//
//  MissionsCellCollectionViewCell.swift
//  JustoTestFRR
//
//  Created by Felipe Romano on 13/12/22.
//

import UIKit

class MissionsCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var missionName: UILabel!
    @IBOutlet weak var fligth: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.styles()
    }
    private func styles(){
        self.addShadowAndCornerRadius(radius: 10, backView: self.backView)
    }
    func config(mission:Mission){
        self.missionName.text = mission.name
        self.fligth.text = String(mission.flight ?? 0)
    }

}
