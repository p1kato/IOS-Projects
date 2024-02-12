//
//  Command.swift
//  csgoPlayers
//
//  Created by Dias Narysov on 2/7/24.
//

import Foundation
import SwiftyJSON

struct Team {
    var name = ""
    var picture = ""
    var flag = ""
    var players: [Player] = []
    
    
    init(json: JSON) {
        
        name = json["name"].stringValue
        
        if let item = json["flag"].string  {
            flag = item
        }
        if let item = json["picture"].string  {
            picture = item
        }
        
        if let players = json["players"].array {
            for player in players {
                self.players.append(Player(json: player))
            }
        }
    }
}
