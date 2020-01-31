//
//  ViewController.swift
//  ProyectoEjercicio
//
//  Created by ander zugasti on 18/01/2020.
//  Copyright © 2020 ander zugasti. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var mapa: MKMapView!
    let locatinManager = CLLocationManager()
    
    @IBOutlet weak var empezarButt: UIButton!

    override func viewDidLoad() {
       
        super.viewDidLoad()
        checkLocationServices()
        
        
        
    }
    func setupLocationManager(){
        locatinManager.delegate = self
        locatinManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    @IBAction func empezarbutt(_ sender: Any) {
        mapa.showsUserLocation = true 
    }
    
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            
        }else{
            
        }
    }
    }
extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager,didUpdateLocation location: [CLLocation]){
        
    }
    func locationManager(_ manager: CLLocationManager,didChangeAuthorization status: CLAuthorizationStatus){
        
    }
}





