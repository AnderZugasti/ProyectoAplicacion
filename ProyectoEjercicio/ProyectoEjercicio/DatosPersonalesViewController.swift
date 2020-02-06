//
//  DatosPersonalesViewController.swift
//  ProyectoEjercicio
//
//  Created by ander zugasti on 03/02/2020.
//  Copyright © 2020 ander zugasti. All rights reserved.
//

import UIKit

class DatosPersonalesViewController: UIViewController {
    @IBOutlet weak var alturatxt: UITextField!
    @IBOutlet weak var pesotxt: UITextField!
   
    @IBOutlet weak var gorduralbl: UILabel!
    
    @IBOutlet weak var objetivoAndando: UITextField!
    @IBOutlet weak var objetivoCorrer: UITextField!
    @IBOutlet weak var objetivoBici: UITextField!
    let def = UserDefaults.standard
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
    }
    
    @IBAction func Guardar_Editar(_ sender: Any) {
        
        
            
            def.set(alturatxt.text, forKey: "Altura")
            def.set(pesotxt.text, forKey: "Peso")
            def.set(objetivoAndando.text,forKey:"objetivoAndando")
            def.set(objetivoCorrer, forKey: "objetivoCorrer")
            def.set(objetivoBici, forKey: "objetivoBici")
            
        
        
    }
    
}
