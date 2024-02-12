//
//  Joke.swift
//  JokesApp
//
//  Created by Dias Narysov on 2/10/24.
//

import Foundation
import SwiftyJSON

struct Joke {
    var text = ""
    
    init() {}
    
    init(json: JSON) {
        if let type = json["type"].string {
            if type == "single" {
                text = json["joke"].stringValue
            } else {
                text = "\(json["setup"].stringValue)\n\(json["delivery"].stringValue)"
            }
        }
    }
}
