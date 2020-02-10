//
//  ViewController.swift
//  ProyectoEjercicio
//
//  Created by ander zugasti on 18/01/2020.
//  Copyright © 2020 ander zugasti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
   
    
    @IBOutlet weak var Menu: UIStackView!
    
    @IBOutlet weak var buttMenu: UIBarButtonItem!
    var activo = false
   
    
    @IBOutlet weak var pantallaAzul: UIView!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        Menu.isHidden = true
    }
    
    @IBAction func menuBut(_ sender: Any) {
        if (!activo){
            Menu.isHidden = false
            activo = true
        }else{
            Menu.isHidden = true
            activo = false
        }
    }
}







