//
//  ViewController.swift
//  ProyectoEjercicio
//
//  Created by ander zugasti on 18/01/2020.
//  Copyright © 2020 ander zugasti. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController {
    
    
    
    
    override func viewDidLoad() {

        
        
        super.viewDidLoad()
       
    }
    @IBAction func correrbut(_ sender: Any) {
        select = 1
    }
    @IBAction func bicibut(_ sender: Any) {
        select = 2
    }
    @IBAction func andarbut(_ sender: Any) {
        select = 3
    }
    var select = 0
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if( segue.identifier == "correr") {
        let destino = segue.destination as! MapaViewController;
            destino.seleccionEjercicio = 1
        }
        
            
        
    
    
    }
    @IBAction func munuButt(_ sender: Any) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
   
}








