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
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var tiempo : Timer!
    
    var actualizaContador : Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actualizaContador = 0
        
        tiempo = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PrimeroViewController.actualizaTiempo), userInfo: nil, repeats: true)

        lblNombre.text = param.nombre
        lblDescripcion.text = param.descripcion
        lblCosto.text = "S/. \(param.costo!)"
        // Do any additional setup after loading the view.
    }
    
    internal func actualizaTiempo(){
        if(actualizaContador <= 2){
            pageControl.currentPage = actualizaContador
            switch actualizaContador {
            case 0:
                imgView.image = param.imagen
            case 1:
                imgView.image = param.imagen2
            default:
                imgView.image = param.imagen3
            }
            actualizaContador = actualizaContador + 1
        }else{
            actualizaContador = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnComprar(_ sender: UIButton) {
        
        if !carrito.contains(param) {
            
            let alerta = UIAlertController(title: "Alerta", message: "Se agrego al carrito",preferredStyle: UIAlertControllerStyle.alert)
            let accionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle .default, handler: nil)
            
            alerta.addAction(accionOK)
            self.present(alerta, animated: true, completion: nil)
            
            carrito.append(param)
        }
        
    
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
