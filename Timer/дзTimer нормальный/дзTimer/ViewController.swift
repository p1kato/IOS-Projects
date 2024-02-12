//
//  ViewController.swift
//  дзTimer
//
//  Created by Азамат Булегенов on 14.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelN: UILabel!
    
    @IBOutlet weak var labelD: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var newsv = News(name: "", imageName: "", description: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        labelN.text = newsv.name
        labelD.text = newsv.description
        imageView.image = UIImage(named: newsv.imageName)
    }


    
}

