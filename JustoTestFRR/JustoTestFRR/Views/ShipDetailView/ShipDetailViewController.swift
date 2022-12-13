//
//  ShipDetailViewController.swift
//  JustoTestFRR
//
//  Created by Felipe Romano on 13/12/22.
//

import UIKit

class ShipDetailViewController: UIViewController {
    
    @IBOutlet weak var shipType: UILabel!
    @IBOutlet weak var shipModel: UILabel!
    @IBOutlet weak var shipName: UILabel!
    @IBOutlet weak var shipImage: UIImageView!
    @IBOutlet weak var shipIsActive: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var ship:ShipsModelElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configView()
        self.registerCells()
        
    }
    
    /// carga los datos a la pantalla
    private func configView(){
        DispatchQueue.main.async {
            
            if let urlImage = self.ship?.image{
                self.shipImage.downloadImage(url: urlImage)
            }
            self.shipName.text = self.ship?.ship_name
            self.shipType.text = self.ship?.ship_type
            self.shipModel.text = self.ship?.ship_model
            self.shipIsActive.text = self.ship?.active ?? false ? "active" : "deactive"
            self.location.text = self.ship?.home_port
            
        }
        
        
    }
    
    /// inicializa y registra celda HeroeCollectionViewCell para el collectionView
    private func registerCells(){
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        collectionView.register(UINib.init(nibName: "MissionsCellCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "MissionsCellCollectionViewCell")
        self.collectionView.reloadData()
        
    }
    
}

extension ShipDetailViewController: UICollectionViewDelegate{
    
}

extension ShipDetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.ship?.missions?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "MissionsCellCollectionViewCell", for: indexPath) as! MissionsCellCollectionViewCell
        if let mission = self.ship?.missions {
            celda.config(mission: mission[indexPath.row])
        }
        return celda
    }
    
}

extension ShipDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
