//
//  ViewController.swift
//  mapView_homeWork
//
//  Created by Dias Narysov on 2/2/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailNameLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    let locationManager = CLLocationManager()
    
    var userLocation = CLLocation()
    
    var followMe = false
    
    var attraction = Attractions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = attraction.name
        imageView.image = UIImage(named: attraction.imagename)
        detailNameLabel.text = attraction.detailAbout
        
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
       
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
        
        mapView.setRegion(MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)), animated: true)
        
    
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        userLocation = locations[0]
        drawRoute()
            
    }
    
    func drawRoute() {
        // Тут мы задаем координаты для нашей метки
        let lat: CLLocationDegrees = 40.752655
        let long: CLLocationDegrees = -73.977295
        
        // Создаем координату передавая долготу и широту
        let location = CLLocation(latitude: lat, longitude: long)
        
        // Считаем растояние до метки от нашего пользователя
        let meters:CLLocationDistance = location.distance(from: userLocation)
        distanceLabel.text = String(format: "Distance: %.2f m", meters)
        
        
        // Routing - построение маршрута
        // 1 Координаты начальной точки А и точки B
        let sourceLocation = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        
        let destinationLocation = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
        // 2 упаковка в Placemark
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        // 3 упаковка в MapItem
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        // 4 Запрос на построение маршрута
        let directionRequest = MKDirections.Request()
        // указываем точку А, то есть нашего пользователя
        directionRequest.source = sourceMapItem
        // указываем точку B, то есть метку на карте
        directionRequest.destination = destinationMapItem
        // выбираем на чем будем ехать - на машине
        directionRequest.transportType = .automobile
        
        // Calculate the direction
        let directions = MKDirections(request: directionRequest)
        
        // 5 Запускаем просчет маршрута
        directions.calculate { response, error in
            
            // Если будет ошибка с маршрутом
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            // Берем первый машрут
            let route = response.routes[0]
            // Рисуем на карте линию маршрута (polyline)
            self.mapView.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // Настраиваем линию
        let renderer = MKPolylineRenderer(overlay: overlay)
        // Цвет синий
        renderer.strokeColor = UIColor.red
        // Ширина линии
        renderer.lineWidth = 5.0
        
        return renderer
    }
    
    
    @IBAction func mapViewTouched(_ sender: Any) {
        
        let mapVC = storyboard?.instantiateViewController(identifier: "detailMapView") as! MapViewController
        
        mapVC.attraction = attraction
        
        navigationController?.show(mapVC, sender: self)
    }
}

