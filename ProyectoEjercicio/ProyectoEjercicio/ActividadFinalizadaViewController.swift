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
import RealmSwift

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
    var deporte = ""
    let fecha = Date()
    let formater = DateFormatter()
    

     
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapa2: MKMapView!
    @IBOutlet weak var lblObjetivo: UILabel!
    @IBOutlet weak var KM_min: UILabel!
    @IBOutlet weak var distancia: UILabel!
    @IBOutlet weak var tiempo: UILabel!
    
    class Ruta: Object {
        @objc dynamic var distancia = ""
        @objc dynamic var tiempo = ""
        @objc dynamic var recorrido = [[CLLocationCoordinate2D]]()
        @objc dynamic var tienpoPorKm = ""
        @objc dynamic var dia = ""
        @objc dynamic var deporte = ""
        
        

         
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: (ruta2[0][0]), span: span)
        mapa2.setRegion(region, animated:true)
        mapa2.delegate = self
        distancia.text = String(format: "%.02f", KMTotales2/1000)
        calcularTiempo()
        tiempo.text = String("\(horas)h \(minutos)min \(segundos)s")
        calcularKM_min()
        KM_min.text = String("\(minutos2)min \(segundos2)s")
        
        
        for ruta in ruta2 {
            polilinea = MKPolyline(coordinates: ruta, count: ruta.count)
            mapa2.addOverlay(polilinea!)
        }
        
       
    }
    
    
    
    func Objetivo(numero: Int){
        switch numero {
        case 1:
            ejercicio = UserDefaults.standard.string(forKey: "objetivoCorrer")!
            deporte = "Correr"
        case 2:
            ejercicio = UserDefaults.standard.string(forKey: "objetivoBici")!
            deporte = "Bici"
        case 3:
            ejercicio = UserDefaults.standard.string(forKey: "objetivoAndando")!
            deporte = "Andar"
        default:
            ejercicio = "ninguno"
        }
        let reto: Double = Double(ejercicio) as! Double
        if (KMTotales2/1000 >  reto){
            switch numero {
            case 1:
                UserDefaults.standard.set(String((Int(ejercicio) ?? 0)+5), forKey: "objetivoCorrer")
           
            case 2:
                UserDefaults.standard.set(String((Int(ejercicio) ?? 0)+10), forKey: "objetivoBici")
            case 3:
                UserDefaults.standard.set(String((Int(ejercicio) ?? 0)+5), forKey: "objetivoAndando")
            default:
                ejercicio = "ninguno"
            }
            lblObjetivo.text = "objetivo superado"
            
        }
        else{
            lblObjetivo.text = "objetivo no superado"
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
    
    
    
    func guardaDatos() -> Ruta {
        formater.dateFormat = "dd.MM.yyyy"
        let result = formater.string(from: fecha)
        /*Datos para guardar*/
        let KMGuardar = distancia.text
        let TiempoGuardar = tiempo.textInputContextIdentifier
        let KMinGuardar = KM_min.text
        let recorridoGuardar = ruta2
        
        let nuevoRecorrido = Ruta()
        
        nuevoRecorrido.distancia = KMGuardar!
        nuevoRecorrido.tiempo = TiempoGuardar!
        nuevoRecorrido.recorrido = recorridoGuardar
        nuevoRecorrido.tienpoPorKm = KMinGuardar!
        nuevoRecorrido.dia = String(result)
        nuevoRecorrido.deporte = deporte
        
        return nuevoRecorrido
    }
    
    @IBAction func GuardarButt(_ sender: Any) {
        let alertController = UIAlertController(title:"¿Esta seguro que desea guardar los datos?", message: "",preferredStyle: UIAlertController.Style.alert)
        
        let GuardarAction = UIAlertAction(title: "Guardar", style: .default) { (action) in
            let realm = try! Realm()
            let rutaAGuardar = self.guardaDatos()
            try! realm.write{
            realm.add(rutaAGuardar)
            self.navigationController?.popToRootViewController(animated: true)
                
            }
        }
        let CancelarAction = UIAlertAction(title: "Cancelar", style: .cancel) { (action) in
            
        }
        alertController.addAction(CancelarAction)
        alertController.addAction(GuardarAction)
        
        self.present(alertController, animated: true)
        }
    
    @IBAction func DescartarButt(_ sender: Any) {
        let alertController = UIAlertController(title:"¿Esta seguro que desea descartar la ruta?", message: "",preferredStyle: UIAlertController.Style.alert)
        let pantallaPrincipal = UIAlertAction(title: "Si", style: .default) { (action) in
            
            self.navigationController?.popToRootViewController(animated: true)

        }
        
        let CancelarAction = UIAlertAction(title: "Atras", style: .cancel) { (action) in
            
        }
        alertController.addAction(CancelarAction)
        alertController.addAction(pantallaPrincipal)
       
        
        self.present(alertController, animated: true)
        }
    
    
    

}

extension UINavigationController {
  func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(vc, animated: animated)
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
