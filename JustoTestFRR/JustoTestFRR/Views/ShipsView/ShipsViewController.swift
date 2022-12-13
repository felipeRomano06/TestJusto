//
//  HomeViewController.swift
//  JustoTestFRR
//
//  Created by Felipe Romano on 12/12/22.
//

import UIKit


protocol ShipsViewModelProtocol:AnyObject {
    func showLoader()
    func hideLoader()
    func loadShips(ships:[ShipsModelElement])
}

class ShipsViewController: UIViewController {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var shipsViewModel = {
        ShipsViewModel(vc: self)
    }()
    
    var ships: [ShipsModelElement] = []
    var isUpdating = false
    var isFullCards = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spinner.startAnimating()
        self.registerCells()
        self.shipsViewModel.getShipsCatalog()

    }
    
    /// inicializa y registra celda HeroeCollectionViewCell para el collectionView
    private func registerCells(){
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        collectionView.register(UINib.init(nibName: "ShipCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "ShipCollectionViewCell")
        
    }
}


extension ShipsViewController: ShipsViewModelProtocol{
    
    /// muestra el loader
    func showLoader() {
        self.spinner.isHidden = false
        self.spinner.startAnimating()
    }
    
    ///Esconde el loader
    func hideLoader() {
        self.spinner.isHidden = true
        self.spinner.stopAnimating()
        
    }
    ///Carga los ships al collectionView
    func loadShips(ships: [ShipsModelElement]) {
        self.ships.append(contentsOf: ships)
        isUpdating = false
        if ships.count != 0{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }else{
            isFullCards = true
        }
        
    }
    
    
}


extension ShipsViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "ShipDetailView", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ShipDetailViewController") as! ShipDetailViewController
        
        vc.ship = ships[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if !isUpdating && !isFullCards{
            if position > collectionView.contentSize.height - scrollView.frame.size.height{
                print("Llego al final")
                isUpdating = true
                if self.ships.count != 0 {
                    self.shipsViewModel.getShipsCatalog()
                }
            }
            
        }
        
    }
    
}

extension ShipsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.ships.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "ShipCollectionViewCell", for: indexPath) as! ShipCollectionViewCell
        celda.config(ship: self.ships[indexPath.row])
        
        return celda
        
    }
    
    
}

extension ShipsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: (collectionView.bounds.height/4))
    }
}
