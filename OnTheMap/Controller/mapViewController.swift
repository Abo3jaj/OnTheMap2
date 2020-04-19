//
//  MapViewController.swift
//  OnTheMap
//
//  Created by omar Al-joundi on 4/16/20.
//  Copyright © 2020 omar Al-joundi. All rights reserved.
//

import UIKit
import Foundation
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var MapView: MKMapView!
    
    
    override func viewDidLoad() {
        OnTheMap.getMultipleStudents { (users, error) in
            usersModel.results = users
            
        }
    
    
    let location = usersModel.results
    var annotations = [MKPointAnnotation]()
    
    for StudentLocation in location  {
    
    let lat = CLLocationDegrees(StudentLocation["latitude"] as! Double)
    let long = CLLocationDegrees(StudentLocation["longitude"] as! Double)
    let first = location["firstName"] as! String
    let last = location["lastName"] as! String
    let mediaURL = location["mediaURL"] as! String
    
    }


}

}







