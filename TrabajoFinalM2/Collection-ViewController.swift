//
//  Collection-ViewController.swift
//  TrabajoFinalM2
//
//  Created by Rocío Córdova on 19/03/17.
//  Copyright © 2017 Rocío Córdova. All rights reserved.
//

import UIKit

private let reuseIdentifier = "colect"

public var carrito = Array<Item>()
public var items = Array<Item>()

class Collection_ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchResultsUpdating {
    
    var itemsFiltrados = Array<Item>()
    
    
    @IBOutlet weak var buscador: UISearchBar!
    
    let searchcontroller = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var colection: UICollectionView!
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let texto = searchController.searchBar.text
        
        itemsFiltrados = items.filter({ (item) -> Bool in
            return String(item.costo).lowercased().contains(texto!.lowercased()) || item.nombre.lowercased().contains(texto!.lowercased())
        })
        colection.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchcontroller.searchBar.prompt = "Titulo"
        searchcontroller.searchResultsUpdater = self
        

        // Do any additional setup after loading the view.
        
        for i in 1...10 {
            let item = Item()
            item.nombre = "Item \(i)"
            item.descripcion = "Descripción completa del Item \(i) y sus características"
            item.costo = Double(i) * 10.0
            item.imagen = UIImage(named: "image_\(i)")
            item.imagen2 = UIImage(named: "image2_\(i)")
            item.imagen3 = UIImage(named: "image3_\(i)")
            
            items.append(item)
        }
        
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCVC
        
        let item = items[indexPath.row]
        cell.lblNombre.text = item.nombre
        cell.lblCosto.text = "$\(item.costo!)"
        cell.imgImagen.image = item.imagen
        
        let longPressGR = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        longPressGR.minimumPressDuration = 1
        cell.addGestureRecognizer(longPressGR)
        
        // Configure the cell
        
        return cell
    }
    
    func longPress(sender: UILongPressGestureRecognizer){
        
        let cell = sender.view as! UICollectionViewCell
        //colection?
        let indexPath = colection?.indexPath(for: cell)
        let item = items[(indexPath?.row)!]
        
        
        if !carrito.contains(item) {
            
            let alerta = UIAlertController(title: "Alerta", message: "Se agrego al carrito",preferredStyle: UIAlertControllerStyle.alert)
            let accionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle .default, handler: nil)
            
            alerta.addAction(accionOK)
            self.present(alerta, animated: true, completion: nil)
            
            carrito.append(item)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let item = items[indexPath.row]
        
        
        self.performSegue(withIdentifier: "siguiente", sender: item)
        
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Item!) {
        let controlador:PrimeroViewController = segue.destination as! PrimeroViewController
        
        controlador.param = sender
    }
    
    @IBAction func btnCarrito(_ sender: UIBarButtonItem) {
         self.performSegue(withIdentifier: "transicion", sender: sender)
    }
    
    
}
