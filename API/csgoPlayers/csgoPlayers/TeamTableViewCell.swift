//
//  TeamTableViewCell.swift
//  csgoPlayers
//
//  Created by Dias Narysov on 2/7/24.
//

import UIKit
import SDWebImage

class TeamTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var flagImageName: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(team: Team) {
        
        nameLabel.text = team.name
        
        pictureImageView.sd_setImage(with: URL(string: team.picture))
        flagImageName.sd_setImage(with: URL(string: team.flag))
        
    }

}
