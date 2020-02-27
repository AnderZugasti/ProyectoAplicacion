//
//  ViewController.swift
//  ProyectoEjercicio
//
//  Created by ander zugasti on 18/01/2020.
//  Copyright © 2020 ander zugasti. All rights reserved.
//

import UIKit
import SideMenu
import RealmSwift
class ViewController: UIViewController {
    
    @IBOutlet weak var fechalbl: UILabel!
    @IBOutlet weak var Distancialbl: UILabel!
    @IBOutlet weak var Tiempolbl: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var txtlbl: UILabel!
    @IBOutlet weak var recuadro: UIView!
    
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(self.navigationController!.isToolbarHidden){
            self.navigationController?.setNavigationBarHidden(false, animated: false)
            
        }
        let realm = try! Realm()
        var rutas: Results<Ruta> { 
            get{
                return realm.objects(Ruta.self)
            }
        }
            if rutas.isEmpty{
                txtlbl.text = "Elige un ejercicio para relizar"
            }else{
                let ultimo = rutas.count-1
                txtlbl.text = "Ultimo recorrido"
                fechalbl.text = rutas[ultimo].dia
                Distancialbl.text = String(rutas[ultimo].distancia) + " Km"
                Tiempolbl.text = rutas[ultimo].tiempo
                imagen.layer.borderWidth = 1
                imagen.layer.borderColor = UIColor.black.cgColor
                imagen.layer.cornerRadius = 20
                imagen.clipsToBounds = true
                recuadro.layer.borderWidth = 1
                recuadro.layer.borderColor = UIColor.black.cgColor
                recuadro.layer.cornerRadius = 20
                switch rutas[ultimo].deporte{
                case "Correr":
                    imagen.image =  UIImage(named:"correr" )
                   
                    
                case "Bici":
                    imagen.image =  UIImage(named:"bici" )
                case "Andar":
                    imagen.image =  UIImage(named:"andando" )
                default:
                    print("error")
                }
                
            }
        }
    }









