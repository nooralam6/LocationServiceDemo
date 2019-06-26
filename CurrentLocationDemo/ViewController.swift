//
//  ViewController.swift
//  CurrentLocationDemo
//
//  Created by Nooralam Shaikh on 26/06/19.
//  Copyright © 2019 Sunday Mobility. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationWrapper = LocationService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationWrapper.delegate = self
    }
    

}

extension ViewController: LocationServiceDelegate {
    var currentLocation: CLLocationCoordinate2D? {
        get {
            return locationWrapper.currentLocation
        }
        set {
            if let userLocation = currentLocation {
                print(userLocation)
                let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 100, longitudinalMeters: 100)
                locationWrapper.locationManager.stopUpdatingLocation()
                mapView.setRegion(viewRegion, animated: true)
                mapView.showsUserLocation = true
            }
        }
    }
}
