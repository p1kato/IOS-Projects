//
//  Player.swift
//  csgoPlayers
//
//  Created by Dias Narysov on 2/8/24.
//

import Foundation
import SwiftyJSON

struct Player {
    
    var name = ""
    var nickName = ""
    var avatar = ""
    
    init(json: JSON) {
        name = json["name"].stringValue
        nickName = json["nickName"].stringValue
        avatar = json["avatar"].stringValue
    }
    
}
