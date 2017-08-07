//
//  CurrentLocationModel.swift
//  TipCalculator
//
//  Created by Jose Muniz on 7/29/17.
//  Copyright © 2017 Jose Muniz. All rights reserved.
//

import Foundation
import CoreLocation

class CurrentLocationModel: NSObject, CLLocationManagerDelegate {
    static let global: CurrentLocationModel = CurrentLocationModel()
    
    var locationManager: CLLocationManager
    var coordinate: CLLocationCoordinate2D
    var country: String?
    var callback: ((String?) -> Void)?
    
    override init() {
        locationManager = CLLocationManager()
        coordinate = CLLocationCoordinate2D(latitude: 0,longitude: 0)
        country = nil
        callback = nil
        
        super.init()

        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }

    }
    
    func subscribeLocationListener(callback: @escaping (String?) -> Void) {
      self.callback = callback
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.coordinate = manager.location!.coordinate
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error) -> Void in
            self.country = placemarks?[0].country
            self.callback.map { fn in
                fn(self.country)
            }
        })
    }
    
    func getCurrentLocation() -> String? {
        return self.country
    }
}
