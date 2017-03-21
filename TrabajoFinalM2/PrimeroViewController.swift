//
//  PrimeroViewController.swift
//  TrabajoFinalM2
//
//  Created by Rocío Córdova on 20/03/17.
//  Copyright © 2017 Rocío Córdova. All rights reserved.
//

import UIKit

class PrimeroViewController: UIViewController {

    @IBOutlet weak var lblNombre: UILabel!
    
    @IBOutlet weak var lblDescripcion: UILabel!
    
    @IBOutlet weak var lblCosto: UILabel!
    
   
    var param:Item! 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblNombre.text = param.nombre
        lblDescripcion.text = param.descripcion
        lblCosto.text = "S/. \(param.costo)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
