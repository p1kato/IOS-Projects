//
//  WorldWonder.swift
//  WorldWonders
//
//  Created by Dias Narysov on 2/7/24.
//

import Foundation
import SwiftyJSON

struct WorldWonder {
    var name = ""
    var region = ""
    var location = ""
    var flag = ""
    var picture = ""
    
    init(json: JSON) {
        
        name = json["name"].stringValue
        
        if let item = json["region"].string  {
            region = item
        }
        if let item = json["location"].string  {
            location = item
        }
        if let item = json["flag"].string  {
            flag = item
        }
        if let item = json["picture"].string  {
            picture = item
        }
    }
}
