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
    @IBOutlet weak var estadoActual: UILabel!
    
    @IBOutlet weak var gorduralbl: UILabel!
    
    @IBOutlet weak var objetivoAndando: UITextField!
    @IBOutlet weak var objetivoCorrer: UITextField!
    @IBOutlet weak var objetivoBici: UITextField!
    let def = UserDefaults.standard
    
    override func viewDidLoad() {
    super.viewDidLoad()
        if ((UserDefaults.standard.string(forKey: "Altura")) != nil){
            alturatxt.text = UserDefaults.standard.string(forKey: "Altura")
            alturatxt.isUserInteractionEnabled = false
        }
         if ((UserDefaults.standard.string(forKey: "objetivoAndando")) != nil){
             objetivoAndando.text = UserDefaults.standard.string(forKey: "objetivoAndando")
             objetivoAndando.isUserInteractionEnabled = false
        }
           if ((UserDefaults.standard.string(forKey: "objetivoCorrer")) != nil){
            objetivoCorrer.text = UserDefaults.standard.string(forKey: "objetivoCorrer")
            objetivoCorrer.isUserInteractionEnabled = false
        }
            if ((UserDefaults.standard.string(forKey: "objetivoBici")) != nil){
            objetivoBici.text = UserDefaults.standard.string(forKey: "objetivoBici")
            objetivoBici.isUserInteractionEnabled = false
        }
           
            pesotxt.text = UserDefaults.standard.string(forKey: "Peso")
            print(UserDefaults.standard.string(forKey: "objetivoCorrer"))
            print(UserDefaults.standard.string(forKey: "objetivoAndando")!)
            print(UserDefaults.standard.dictionaryRepresentation().keys)
            
        if ((UserDefaults.standard.string(forKey: "Altura")) != nil && (UserDefaults.standard.string(forKey: "Peso")) != nil){
        
               
        }
    }
    
    @IBAction func Guardar_Editar(_ sender: Any) {
         if ((UserDefaults.standard.string(forKey: "Altura")) == nil){
           def.set(alturatxt.text, forKey: "Altura")
        }
         if ((UserDefaults.standard.string(forKey: "objetivoAndando")) == nil){
            def.set(objetivoAndando.text,forKey:"objetivoAndando")
        }
         if ((UserDefaults.standard.string(forKey: "objetivoCorrer")) == nil){
            def.set(objetivoCorrer, forKey: "objetivoCorrer")
        }
         if ((UserDefaults.standard.string(forKey: "objetivoBici")) == nil){
             def.set(objetivoBici, forKey: "objetivoBici")
        }
        
            
            
            def.set(pesotxt.text, forKey: "Peso")
            
            
           
            def.synchronize()
            
        
        
    }
    
}
