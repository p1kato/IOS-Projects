//
//  TableViewController.swift
//  mapView_homeWork
//
//  Created by Dias Narysov on 2/2/24.
//

import UIKit

class TableViewController: UITableViewController {

    var array = [
        Attractions(name: "Grand Central Terminal", imagename: "grandCentralTerminal", detailAbout: """
         Grand Central Terminal, неофициально также Grand Central Station) — старейший и известнейший вокзал Нью-Йорка. Расположен в среднем Манхэттене на пересечении 42-й улицы и Парк-авеню. Обслуживает железную дорогу Metro-North.
         """, latitude: 40.752655, longitude: -73.977295),
        
        Attractions(name: "Time Square", imagename: "timeSquare", detailAbout: """
                           Times Square is now considered the heart of New York. In time, it has become the symbol of this vibrant metropolis, with its huge, illuminated advertising hoardings: the star of many a movie!
                           """, latitude: 40.756218690289714, longitude: -73.98693225397068),
        
        Attractions(name: "Central Park", imagename: "centralPark", detailAbout: """
        Central Park is an urban park between the Upper West Side and Upper East Side neighborhoods of Manhattan in New York City that was the first landscaped park in the United States. It is the sixth-largest park in the city, containing 843 acres (341 ha), and the most visited urban park in the United States, with an estimated 42 million visitors annually as of 2016.
        """, latitude: 40.78265218564655, longitude: -73.96549756931378)]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count 
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        
        let nameLabel = cell.viewWithTag(100) as! UILabel
        nameLabel.text = array[indexPath.row].name
        
        let imageName = cell.viewWithTag(101) as! UIImageView
        imageName.image = UIImage(named: array[indexPath.row].imagename)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "detailVC") as! ViewController
        
        detailVC.attraction = array[indexPath.row]
        
        navigationController?.show(detailVC, sender: self)
    }
}
