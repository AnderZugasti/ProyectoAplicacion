//
//  RutasTableViewController.swift
//  ProyectoEjercicio
//
//  Created by ander zugasti on 15/02/2020.
//  Copyright © 2020 ander zugasti. All rights reserved.
//

import UIKit
import RealmSwift

class RutasTableViewController: UITableViewController {

   let realm = try! Realm() // [1]
    var rutas: Results<Ruta> { // [2]
        get{
            return realm.objects(Ruta.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print (rutas)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rutaCount = rutas.count
        return rutaCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! RutaTableViewCell
        
        let num = indexPath.row
        cell.fechalbl.text = rutas[num].dia
        cell.tiempolbl.text = rutas[num].tiempo
        cell.distancialbl.text = rutas[num].distancia
        + " Km"
       
        switch rutas[num].deporte {
        case "Correr":
            cell.icono.image =  UIImage(named:"correr" )
            cell.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
            cell.layer.borderColor = UIColor.blue.withAlphaComponent(0.7).cgColor
            cell.layer.borderWidth = 1.2
        case "Bici":
            cell.icono.image =  UIImage(named:"bici" )
            cell.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
            cell.layer.borderColor = UIColor.gray.withAlphaComponent(0.7).cgColor
            cell.layer.borderWidth = 1.7
        case "Andar":
            cell.icono.image = UIImage(named: "andando")

        default:
            print ("no foto")
        }
        //Configure the cel

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
