//
//  RutaListaViewController.swift
//  ProyectoEjercicio
//
//  Created by  on 18/02/2020.
//  Copyright © 2020 ander zugasti. All rights reserved.
//

import UIKit
import MapKit

class RutaListaViewController: UIViewController {

    @IBOutlet weak var fechaLbl: UILabel!
    @IBOutlet weak var distanciaLbl: UILabel!
    @IBOutlet weak var tiempoLbl: UILabel!
    @IBOutlet weak var mediaLbl: UILabel!
    @IBOutlet weak var mapa: MKMapView!
    
    var tag: Int = 0
    var rutas: Ruta? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: ((rutas?.recorrido[0][0])!), span: span)
        mapa.setRegion(region, animated:true)
        mapa.delegate = self as! MKMapViewDelegate
        
       
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension RutaListaViewController:MKMapViewDelegate{
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

