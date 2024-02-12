//
//  MapViewController.swift
//  mapView_homeWork
//
//  Created by Dias Narysov on 2/3/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {


    @IBOutlet weak var mapView: MKMapView!
    
    var attraction = Attractions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // _____Метка на координате_____
        // Тут мы задаем координаты для нашей метки
        let lat1: CLLocationDegrees = 40.77790480687565
        let long1: CLLocationDegrees = -73.87365615224674
        
        // Создаем координату передавая долготу и широту
        let location1: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat1, long1)
        
        // Создаем метку на карте
        let anotation1 = MKPointAnnotation()
        
        // Создаем координаты на метке
        anotation1.coordinate = location1
        
        // Задаем название для нашей метки
        anotation1.title = "Your location"

        // Задаем описание для нашей метки
        // anotation.subtitle = "Something"
        
        // Добавляем метку на карту
        mapView.addAnnotation(anotation1)
        
        // _____Метка на координате_____
        // Тут мы задаем координаты для нашей метки
        let lat: CLLocationDegrees = attraction.latitude
        let long: CLLocationDegrees = attraction.longitude
        
        // Создаем координату передавая долготу и широту
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        
        // Создаем метку на карте
        let anotation = MKPointAnnotation()
        
        // Создаем координаты на метке
        anotation.coordinate = location
        
        // Задаем название для нашей метки
        anotation.title = attraction.name

        // Задаем описание для нашей метки
        // anotation.subtitle = "Something"
        
        // Добавляем метку на карту
        mapView.addAnnotation(anotation)
        
        
        mapView.setRegion(MKCoordinateRegion(center: location1, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)), animated: true)
        
    }
    

 

}
