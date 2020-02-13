//
//  ActividadFinalizadaViewController.swift
//  ProyectoEjercicio
//
//  Created by  on 06/02/2020.
//  Copyright © 2020 ander zugasti. All rights reserved.
//

import UIKit
import MapKit
import Foundation
import Realm

class ActividadFinalizadaViewController: UIViewController {
    
    var cronometro2: Int = 0
    var KMTotales2: Double = 0.0
    var ruta2 = [[CLLocationCoordinate2D]]()
    var horas:Int = 0
    var minutos: Int = 0
    var segundos: Int = 0
    var division = 0.0
    var horas2:Int = 0
    var minutos2: Int = 0
    var segundos2: Int = 0
    var polilinea : MKPolyline?
    var objetivo = 0
    var ejercicio = ""
    let fecha = Date()
    let formater = DateFormatter()
    

     
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapa2: MKMapView!
    /*@IBOutlet weak var lblObjetivo: UILabel!*/
    @IBOutlet weak var KM_min: UILabel!
    @IBOutlet weak var distancia: UILabel!
    @IBOutlet weak var tiempo: UILabel!
    
    class Ruta: NSObject {
        @objc dynamic var distancia = ""
        @objc dynamic var tiempo = ""
        @objc dynamic var recorrido = [[CLLocationCoordinate2D]]()
        @objc dynamic var tienpoPorKm = ""
        @objc dynamic var dia = ""
        @objc dynamic var deporte = ""
        
        
        
         
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: (ruta2[0][0]), span: span)
        mapa2.setRegion(region, animated:true)
        mapa2.delegate = self
        distancia.text = String(format: "%.02f", KMTotales2/1000)
        calcularTiempo()
        tiempo.text = String("\(horas)h \(minutos)min \(segundos)s")
        calcularKM_min()
        KM_min.text = String("\(horas2)h \(minutos2)min \(segundos2)s")
        
        for ruta in ruta2 {
            polilinea = MKPolyline(coordinates: ruta, count: ruta.count)
            mapa2.addOverlay(polilinea!)
        }
        
       
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
            
            minutos2 = tiempoPara1Km/60
            segundos2 = (tiempoPara1Km)-(60*minutos2)
            }
        else{
            KM_min.text = "Ruta muy corta"
        }
    }
    func guardaDatos(){
        formater.dateFormat = "dd.MM.yyyy"
        let result = formater.string(from: fecha)
        /*Datos para guardar*/
        let KMGuardar = distancia.text
        let TiempoGuardar = tiempo.textInputContextIdentifier
        let KMinGuardar = KM_min.text
        let recorridoGuardar = ruta2
        
        var nuevoRecorrido = Ruta()
        nuevoRecorrido.distancia = KMGuardar!
        nuevoRecorrido.tiempo = TiempoGuardar!
        nuevoRecorrido.recorrido = recorridoGuardar
        nuevoRecorrido.tienpoPorKm = KMGuardar!
        nuevoRecorrido.dia = result
        nuevoRecorrido.deporte = ejercicio
        
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
