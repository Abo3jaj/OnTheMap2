//
//  MapView.swift
//  OnTheMap
//
//  Created by omar Al-joundi on 4/16/20.
//  Copyright © 2020 omar Al-joundi. All rights reserved.
//

import Foundation
import UIKit
import MapKit



class MapView : UIViewController,MKMapViewDelegate {
    
    @IBOutlet weak var MapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         MapView.delegate = self
        OnTheMap.getMultipleStudents { (users, error) in
       
        
       
       
        let locations = users
        var annotations = [MKPointAnnotation]()
    
        
        for studentLocation in locations {
            
            let lat = CLLocationDegrees(studentLocation.latitude)
            let long = CLLocationDegrees(studentLocation.longitude)
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                       
            let first = studentLocation.firstName
            let last = studentLocation.lastName
            let mediaURL = studentLocation.mediaURL

            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "\(first) \(last)"
            annotation.subtitle = mediaURL
            
            print(annotation.coordinate)
             print(annotation.title ?? "")
            print(annotation.subtitle ?? "")
            
    
            annotations.append(annotation)
        }
        

        self.MapView.addAnnotations(annotations)
        }
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
          
          let reuseId = "pin"
          
          var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView

          if pinView == nil {
              pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
              pinView!.canShowCallout = true
              pinView!.pinTintColor = .red
              pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
          }
          else {
              pinView!.annotation = annotation
          }
          
          return pinView
      }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
           if control == view.rightCalloutAccessoryView {
               let app = UIApplication.shared
               if let toOpen = view.annotation?.subtitle! {
                let url = URL(string: toOpen)!
                app.open(url, options: [:], completionHandler: nil)
               }
           }
       }
    
    
    
    
}
