//
//  Table_ViewController.swift
//  TrabajoFinalM2
//
//  Created by Rocío Córdova on 21/03/17.
//  Copyright © 2017 Rocío Córdova. All rights reserved.
//

import UIKit

class Table_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tV: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carrito.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        let item = carrito[indexPath.row]
        
        cell.textLabel?.text = item.nombre
        
        let swipeGR = UISwipeGestureRecognizer(target: self, action:#selector(swipe))
        swipeGR.direction = UISwipeGestureRecognizerDirection.left
        cell.addGestureRecognizer(swipeGR)
        
        return cell
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tV.reloadData()
    }
    
    func swipe(sender: UISwipeGestureRecognizer){
        print("swipe")
        let cell =  sender.view
        // let indexPath =
        
        //carrito.remove(at: (indexPath?.row)!)
        tV.reloadData()
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
