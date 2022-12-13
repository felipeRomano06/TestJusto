//
//  ShipsViewModel.swift
//  JustoTestFRR
//
//  Created by Felipe Romano on 12/12/22.
//

import Foundation
import UIKit


class ShipsViewModel: NSObject {
    
    var ShipServices: ShipsRequestProtocol
    weak var delegate: ShipsViewModelProtocol?
    var offset: Int = 0
    var limit: Int = 9
    
    
    init(ShipsServices: ShipsRequestProtocol = ShipsRequestManager(), vc:UIViewController) {
        self.ShipServices = ShipsServices
        self.delegate = vc as? ShipsViewModelProtocol
    }
    
    
    func getShipsCatalog(){
        self.delegate?.showLoader()
        ShipServices.getShipsCatalog(limit: limit, offset: offset) { ships, code in
            
            self.delegate?.hideLoader()
            
            if code == nil{
                self.offset += 9
                if let ships = ships {
                    self.delegate?.loadShips(ships: ships)
                }
                
            }else{
                print("Error al consultar informacion")
            }
        }
    }
    
    func loadWebHeroe(urlString:String?){
        
       
        
    }
  
    
}
