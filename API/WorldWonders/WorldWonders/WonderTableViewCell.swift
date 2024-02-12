//
//  WonderTableViewCell.swift
//  WorldWonders
//
//  Created by Dias Narysov on 2/7/24.
//

import UIKit
import SDWebImage

class WonderTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var regionLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var flagImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(wonder: WorldWonder) {
        
        nameLabel.text = wonder.name
        regionLabel.text = wonder.region
        locationLabel.text = wonder.location
        
        pictureImageView.sd_setImage(with: URL(string: wonder.picture))
        flagImageView.sd_setImage(with: URL(string: wonder.flag))
        
    }
    
    
}
