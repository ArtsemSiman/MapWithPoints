//
//  ViewController.swift
//  Map with points
//
//  Created by Артём Симан on 12.05.22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
        let pin = MKPlacemark(coordinate:CLLocationCoordinate2D(latitude: 53.982061, longitude: 27.381842))
        let coordinateRegion = MKCoordinateRegion(center: pin.coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.addAnnotation(pin)

        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 53.898645, longitude: 27.556762)
        annotation.title = "Минск"
        annotation.subtitle = "Центр"
        let coordinateRegion1 = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
        mapView.setRegion(coordinateRegion1, animated: true)
        mapView.addAnnotation(annotation)
        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 53.7524451, longitude: 26.0224616)
        annotation1.title = " Любча"
        annotation1.subtitle = "ГП"
        let coordinateRegion2 = MKCoordinateRegion(center: annotation1.coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
        mapView.setRegion(coordinateRegion2, animated: true)
        mapView.addAnnotation(annotation1)
        
        mapView.camera.centerCoordinate = CLLocationCoordinate2D(latitude: 53.982061, longitude: 27.381842)
    }

   
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:", error)
    }
}

