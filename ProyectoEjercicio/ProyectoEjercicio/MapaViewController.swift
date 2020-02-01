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
    @IBOutlet weak var kmContadorlbl: UILabel!
    @IBOutlet weak var kmlbl: UILabel!
    @IBOutlet weak var mapa: MKMapView!
    @IBOutlet weak var InicioBoton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    var KMTotales: Double=0
    var ruta: MKPolyline?
    var ArrayPuntos = [CLLocationCoordinate2D]()
    var enFuncionamiento = false
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        localizar()
        FinalizarBoton.isHidden = true
        kmlbl.isHidden = true
        kmContadorlbl.isHidden = true
        pauseButton.isHidden = true
        
        
        locationManager.delegate = self
        mapa.delegate = self
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
        
        
}
    
    
    @IBAction func EmpezarButt(_ sender: Any) {
        FinalizarBoton.isHidden = false
        InicioBoton.isHidden = true
        kmContadorlbl.isHidden = false
        kmlbl.isHidden = false
        pauseButton.isHidden = false
        
         enFuncionamiento = true
        
         
        
        
        
        
    }
    
    @IBAction func PauseButt(_ sender: Any) {
        enFuncionamiento = false
        InicioBoton.isHidden = false
        pauseButton.isHidden = true
    }
    @IBAction func FinalizarButt(_ sender: Any) {
        
        
        kmContadorlbl.isHidden = false
        kmlbl.isHidden = false
    }
    
    }
    
extension MapaViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let miLocalizacion = locations.last else {return}
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)

        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(miLocalizacion.coordinate.latitude,  miLocalizacion.coordinate.longitude )

        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        mapa.setRegion(region, animated:true)
        
        
        
       
        if (enFuncionamiento){
            
            if (ArrayPuntos .isEmpty){
            }else{
                let puntoAnterior: MKMapPoint = MKMapPoint(((ArrayPuntos.last ?? nil)!))
                let puntoActual: MKMapPoint = MKMapPoint(myLocation)
                let distanciaRecorrida = puntoAnterior.distance(to: puntoActual)
                KMTotales += distanciaRecorrida}
            
            
             
            
            
           
            ArrayPuntos.append(myLocation)
             print(myLocation)
             ruta = MKPolyline(coordinates: ArrayPuntos, count:  ArrayPuntos.count)
            mapa.addOverlay(ruta!)
            self.kmContadorlbl.text = String(format: "%.03f", KMTotales/1000)
            
            
        }else{
            ArrayPuntos.removeAll()
        }
        
        
        
    }}
extension MapaViewController:MKMapViewDelegate{
    func mapView(_ mapView: MKMapView,rendererFor overlay: MKOverlay)-> MKOverlayRenderer!{
        if (overlay is MKPolyline){
            let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
            renderer.strokeColor = UIColor.blue.withAlphaComponent(0.8)
            renderer.lineWidth=4
             return renderer
        }
    
        
       return nil
   
       
        
  
    }
}


    
        
        
    




