//
//  ItemsCVController.swift
//  TrabajoFinalM2
//
//  Created by Rocío Córdova on 19/03/17.
//  Copyright © 2017 Rocío Córdova. All rights reserved.
//

/*
import UIKit

private let reuseIdentifier = "colect"

public var carrito = Array<Item>()
public var items = Array<Item>()

class ItemsCVController: UICollectionViewController, UISearchResultsUpdating {
    
    
    var itemsFiltrados = Array<Item>()

    let buscador = UISearchController(searchResultsController: nil)
    
    
    @IBOutlet var colection: UICollectionView!
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let texto = searchController.searchBar.text
        
        itemsFiltrados = items.filter({ (item) -> Bool in
            return String(item.costo).lowercased().contains(texto!.lowercased()) || item.nombre.lowercased().contains(texto!.lowercased())
        })
        colection.reloadData()
    
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buscador.searchBar.prompt = "Titulo"
        buscador.searchResultsUpdater = self
        
        
        
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
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
        let indexPath = collectionView?.indexPath(for: cell)
        let item = items[(indexPath?.row)!]
        
        
        if !carrito.contains(item) {
            
            let alerta = UIAlertController(title: "Alerta", message: "Se agrego al carrito",preferredStyle: UIAlertControllerStyle.alert)
            let accionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle .default, handler: nil)
            
            alerta.addAction(accionOK)
            self.present(alerta, animated: true, completion: nil)
            
            carrito.append(item)
        }
        
        }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let indice = indexPath.row
        
        let item = items[indice]
        
        
        self.performSegue(withIdentifier: "siguiente", sender: item)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let siguienteViewController:ViewController = segue.destination as! ViewController
        
        siguienteViewController.parametro = sender as! Item
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
 */
