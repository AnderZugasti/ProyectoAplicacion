//
//  MenuViewController.swift
//  ProyectoEjercicio
//
//  Created by  on 14/02/2020.
//  Copyright © 2020 ander zugasti. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "correr":
            let destino = segue.destination as! MapaViewController;
            destino.seleccionEjercicio = 1
        case "bici":
            let destino = segue.destination as! MapaViewController;
            destino.seleccionEjercicio = 2
        case "andar":
            let destino = segue.destination as! MapaViewController;
            destino.seleccionEjercicio = 3
            
        default:
            print("nada")
            
            
        }
        
        
            
        
    
    
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
