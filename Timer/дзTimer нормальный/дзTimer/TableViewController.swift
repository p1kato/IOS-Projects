//
//  TableViewController.swift
//  дзTimer
//
//  Created by Азамат Булегенов on 14.01.2024.
//

import UIKit

class TableViewController: UITableViewController {
    var sourceArray = [
        News(name: "Избиение водителя скорой", imageName: "new1", description: "1 февраля при координации Генеральной \n: прокуратуры в Карагандинской области задержан Дакебаев Нурболат Нурымович, подозреваемый в нанесении телесных повреждений водителю скорой помощи 27 января текущего года в Караганде."),
        News(name: "Казах, усыновленный европейцами", imageName: "new2", description: "История 21-летнего Эдди Жана (при рождении Жанибек), усыновленного бельгийцами, с прошлого года бурно обсуждается в сети. Известно, что Жанибек и журналист Кымбат Досжан продолжают поиски его биологической мамы. Ранее ДНК-тесты проходили три женщины, однако родство установить так и не удалось. Сегодня появились новые подробности касательно личности Жанибека. Подробнее рассказывает"),
        News(name: "В Казахстане предложили вдвое поднять зарплаты", imageName: "new3", description: "Депутат Мажилиса Жулдыз Сулейменова обратилась с запросом к вице-премьеру Тамаре Дуйсеновой, курирующей сферу труда. Сулейменова попросила рассмотреть вопрос увеличения заработных плат некоторым категориям работников в Казахстане, передает корреспондент Tengrinews.kz.")
    ]
    
    var showArray: [News] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
    }

    @objc func countTime(){
        if sourceArray.count < 1 {
            return
        }
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, HH:mm"
        let currentTime = dateFormatter.string(from: date)
        var news = sourceArray.removeLast()
        news.time = currentTime
        
        showArray.insert(news, at: 0)
        tableView.reloadData()
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        <#code#>
    //    }
    //
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return showArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        let labelName = cell.viewWithTag(1) as! UILabel
        labelName.text = "\(showArray[indexPath.row].name)"
        
        let labelPrice = cell.viewWithTag(2) as! UILabel
        labelPrice.text = "\(showArray[indexPath.row].description)"
        
        let imageView = cell.viewWithTag(3) as! UIImageView
        imageView.image = UIImage(named: showArray[indexPath.row].imageName)
      
        let labelTime = cell.viewWithTag(4) as! UILabel
        labelTime.text = showArray[indexPath.row].time
        
        
        
        //        cell.textLabel?.text = new[indexPath.row].name
        //        cell.detailTextLabel?.text = new[indexPath.row].description
        //        cell.imageView?.image = new[indexPath.row].imageName
        
        //        cell.label1?.text = new[indexPath.row].name
        //        cell.label2?.text = new[indexPath.row].description
        //        cell.image.UIImageView = new[indexPath.row].imageName
        //
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(withIdentifier: "detailViewContreller") as! ViewController
        
//        detailVc.name = arrayPersons[indexPath.row].name
//        detailVc.surname = arrayPersons[indexPath.row].surname
//        detailVc.imagename = arrayPersons[indexPath.row].imagename

        detailVc.newsv = showArray[indexPath.row]
        
        navigationController?.show(detailVc, sender: self)
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
