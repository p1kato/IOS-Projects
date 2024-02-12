//
//  TableViewController.swift
//  JokesApp
//
//  Created by Dias Narysov on 2/10/24.
//

import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
    
    var jokes: [Joke] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        loadJokes()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return jokes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let label = cell.viewWithTag(100) as! UILabel
        label.text = jokes[indexPath.row].text
        
        return cell
    }
    
    func loadJokes() {
        SVProgressHUD.show()
        
        let parameters: [String : Any] = [
            "blacklistFlags": "religious,explicit",
            "amount": 5
        ]
        
        AF.request("https://v2.jokeapi.dev/joke/Dark", method: .get, parameters: parameters).response { response in
            
            SVProgressHUD.dismiss()
            
            if response.response?.statusCode == 200 {
                let json = JSON(response.data!)
                
                if let jokesJson = json["jokes"].array {
                    
                    for joke in jokesJson {
                        self.jokes.append(Joke(json: joke))
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func translateJokes(jokes: [Joke]) {
        jokes.forEach { joke in
            let parameters: [String: Any] = [
                "q": joke,
                "source": "en",
                "target": "ru",
                "format": "text",
                "api_key": ""
            
            ]
            
            AF.request("https://libretranslate.com/translate", method: .post, parameters: parameters, encoding: JSONEncoding.default).response { response in
                if response.response?.statusCode == 200 {
                    let json = JSON(response.data!)
                    
                    if let translated = json["translatedText"].string {
                        var translatedJoke = Joke()
                        translatedJoke.text = translated
                        self.jokes.append(translatedJoke)
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
