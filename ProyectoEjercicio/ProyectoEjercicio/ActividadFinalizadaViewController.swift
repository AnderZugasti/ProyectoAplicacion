//
//  ActividadFinalizadaViewController.swift
//  ProyectoEjercicio
//
//  Created by  on 06/02/2020.
//  Copyright © 2020 ander zugasti. All rights reserved.
//

import UIKit
import MapKit

class ActividadFinalizadaViewController: UIViewController {
    
    var cronometro2: Int = 0
    var KMTotales2: Double = 0.0
    var ruta2 = [CLLocationCoordinate2D]()
    var horas:Int = 0
    var minutos: Int = 0
    var segundos: Int = 0
    var division = 0.0
    var horas2:Int = 0
    var minutos2: Int = 0
    var segundos2: Int = 0
    var polilinea : MKPolyline?
     
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapa2: MKMapView!
    
    @IBOutlet weak var Km_min: UILabel!
    
    @IBOutlet weak var distancia: UILabel!
    @IBOutlet weak var tiempo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: ruta2[(ruta2.count)/2], span: span)
        mapa2.setRegion(region, animated:true)
        mapa2.delegate = self
        distancia.text = String(format: "%.02f", KMTotales2/1000)
        calcularTiempo()
        tiempo.text = String("\(horas)h \(minutos)min \(segundos)s")
        calcularKM_min()
        Km_min.text = String("\(horas2)h \(minutos2)min \(segundos2)s")
        print(ruta2)
        polilinea = MKPolyline(coordinates: ruta2, count: ruta2.count)
        mapa2.addOverlay(polilinea!)

    }
    
    func calcularTiempo(){
         horas = cronometro2 / 3600
         minutos = (cronometro2-(horas*3600))/60
         segundos = ((cronometro2-(horas*3600))-(60*minutos))
    }
    
    func calcularKM_min(){
        
        let tiempoS = Double(cronometro2)
        print ("ok")
        if ((KMTotales2 / 1000) > 1.0){
            print ("ok")
            let tiempoPara1Km = Int(tiempoS / KMTotales2)
            horas2 = tiempoPara1Km / 3600
            minutos2 = (tiempoPara1Km-(horas2*3600))/60
            segundos2 = (((tiempoPara1Km)-(horas2*3600))-(60*minutos2))
            }
        else{
            Km_min.text = "Ruta muy corta"
        }
    }
    
    

}
extension ActividadFinalizadaViewController:MKMapViewDelegate{
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
