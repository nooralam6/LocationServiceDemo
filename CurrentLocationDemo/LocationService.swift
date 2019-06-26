//
//  Location.swift
//  CurrentLocationDemo
//
//  Created by Nooralam Shaikh on 26/06/19.
//  Copyright © 2019 Sunday Mobility. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationServiceDelegate {
    var currentLocation : CLLocationCoordinate2D? { get set }
}

class LocationService: NSObject {
    var locationManager: CLLocationManager
    var currentLocation: CLLocationCoordinate2D?
    var delegate: LocationServiceDelegate?
    
    override init() {
        locationManager = CLLocationManager()
        super.init()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestAlwaysAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        } else {
            //ask user for enabling user location service
        }
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        currentLocation = locValue
        delegate?.currentLocation = locValue
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
}
