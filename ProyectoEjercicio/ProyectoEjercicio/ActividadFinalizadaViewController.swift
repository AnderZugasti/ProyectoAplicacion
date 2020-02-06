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
    var ruta2: MKPolyline?
    var horas:Int = 0
    var minutos: Int = 0
    var segundos: Int = 0
    
    @IBOutlet weak var mapa2: MKMapView!
    
    @IBOutlet weak var Km_min: UILabel!
    @IBOutlet weak var distancia: UILabel!
    @IBOutlet weak var tiempo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        distancia.text = String(format: "%.02f", KMTotales2/1000)
        calcularTiempo()
        tiempo.text = String("\(horas)h \(minutos)min \(segundos)s")
        let minutosPorKm = String(format: "%.0f",((Double(cronometro2) / (KMTotales2/1000))/60))
        let segundosPorKm = String(format: "%.0f",((Double(cronometro2) / (KMTotales2/1000)) - ((Double(cronometro2) / (KMTotales2/1000))/60)))
        
        Km_min.text = String("\(minutosPorKm)min \(segundosPorKm)s")
    }
    
    func calcularTiempo(){
         horas = cronometro2 / 3600
         minutos = (cronometro2-(horas*3600))/60
         segundos = ((cronometro2-(horas*3600))-(60*minutos))
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

    

    

