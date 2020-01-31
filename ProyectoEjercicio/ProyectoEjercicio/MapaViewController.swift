//
//  MapaViewController.swift
//  ProyectoEjercicio
//
//  Created by  on 31/01/2020.
//  Copyright © 2020 ander zugasti. All rights reserved.
//

import UIKit
import MapKit


class MapaViewController: UIViewController {
    
    @IBOutlet weak var FinalizarBoton: UIButton!
    @IBOutlet weak var mapa: MKMapView!
    @IBOutlet weak var InicioBoton: UIButton!
    
    var ArrayPuntos = [CLLocationCoordinate2D]()
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        localizar()
        FinalizarBoton.isHidden = true
        
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        

                   
        // Do any additional setup after loading the view.
    }
    func localizar(){
        
       let status: CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        
         switch status {
        
        
                case .notDetermined:
                    locationManager.requestWhenInUseAuthorization()
                case .restricted:
                 locationManager.requestWhenInUseAuthorization()
                case .denied:
               break
                case .authorizedAlways:
                    mapa.showsUserLocation = true
               case .authorizedWhenInUse:
                    mapa.showsUserLocation = true
                default:
                    break
                }
        mapa.userTrackingMode = .followWithHeading
        
}
    
    
    @IBAction func EmpezarButt(_ sender: Any) {
        FinalizarBoton.isHidden = false
        InicioBoton.isHidden = true
         
        
        
        
    }
    @IBAction func FinalizarButt(_ sender: Any) {
        
    }
    
    }
    
extension MapaViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let miLocalizacion = locations.last else {return}
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)

        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(miLocalizacion.coordinate.latitude,  miLocalizacion.coordinate.longitude )

        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        mapa.setRegion(region, animated:true)

        ArrayPuntos.append(myLocation)

        var ruta = MKPolyline(coordinates: ArrayPuntos, count:  ArrayPuntos.count)

        print(myLocation)
        
        
    }
        
        
    }




