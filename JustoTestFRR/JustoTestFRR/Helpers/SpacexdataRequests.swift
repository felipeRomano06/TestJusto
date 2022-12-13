//
//  SpacexdataRequests.swift
//  JustoTestFRR
//
//  Created by Felipe Romano on 12/12/22.
//

import Foundation

class SpacexdataRequests: NSObject {
    
    
    static var baseURL: String  {
        get{
            
            return "https://api.spacexdata.com/v3"
        }
    }
   

    public enum SpacexdataWebRepository: String
    {
        case ships =  "/ships"
       
    }
    
    /// Obtiene la url para un repositorio solicitado
    /// - Parameter repository: ExcelsiorWebRepository - Repositorio de excélsior.
    /// - Returns: String con el url completo.
    static func getUrl(_ repository: SpacexdataWebRepository)-> String {
        
        let url = baseURL + repository.rawValue
        
        return url
    }
    
    static func SetValues(limit:Int,offset:Int) -> QueryParameters{
        
        let params = QueryParameters(limit: limit, offset: offset)
        
        return params
    }
    
}

struct QueryParameters:Codable{
    var limit: Int
    var offset: Int // = 0
   
}
