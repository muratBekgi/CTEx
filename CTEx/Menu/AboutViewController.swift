//
//  SecondViewController.swift
//  CTEx
//
//  Created by Murat Bekgi on 2/27/20.
//  Copyright © 2020 Murat Bekgi. All rights reserved.
//

import UIKit
import MapKit


final class SchoolAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
        super.init()
        
    }
    
    var region: MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01 )
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}



class AboutViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let csunCoordinate = CLLocationCoordinate2D(latitude: 34.2410, longitude: -118.5277)
        let csunAnnotation = SchoolAnnotation(coordinate: csunCoordinate, title: "CSUN", subtitle:
            "California State University, Northridge is a public university in the Northridge neighborhood of Los Angeles, California")
        
        mapView.addAnnotation(csunAnnotation)
        mapView.setRegion(csunAnnotation.region, animated: true)
    }
    
    @IBAction func `return`(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

extension UIViewController:MKMapViewDelegate {
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let schoolAnnotationView
            = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView {
            schoolAnnotationView
                .animatesWhenAdded = true
            schoolAnnotationView
                .titleVisibility = .adaptive
            schoolAnnotationView
                .titleVisibility = .adaptive
            
            return schoolAnnotationView
            
        }
        
        return nil
    }
}
