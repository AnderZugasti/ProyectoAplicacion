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
    var rutas: [Ruta] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
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
