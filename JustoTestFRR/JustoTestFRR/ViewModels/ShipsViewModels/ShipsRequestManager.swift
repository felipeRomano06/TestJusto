//
//  ShipsRequestManager.swift
//  JustoTestFRR
//
//  Created by Felipe Romano on 12/12/22.
//

import Foundation

protocol ShipsRequestProtocol: NSObject {
    func getShipsCatalog(limit: Int, offset: Int, completion: @escaping ([ShipsModelElement]?, CodeResponse?) -> Void)
}

class ShipsRequestManager: NSObject, ShipsRequestProtocol{
    
    func getShipsCatalog(limit: Int = 5, offset: Int = 0, completion: @escaping ([ShipsModelElement]?, CodeResponse?) -> Void) {
        
        let urlGetAllShips = SpacexdataRequests.getUrl(.ships)
        let parameters = SpacexdataRequests.SetValues(limit: limit, offset: offset)
        
        RequestManager.make(url: urlGetAllShips, metodo: .get, parametros: parameters, completion: {
            (data:[ShipsModelElement]?, code) in
            
            switch code {
            case .ok:
                completion(data, nil)
                break
            case .not_connection:
                print("not_connection")
                completion(nil, code)
                break
            case .none:
                print("none -----<")
                completion(nil, code)
                break
            case .some(_):
                print("none------>")
                completion(nil, code)
                break
            }
            
        })
        
    }
    
}
