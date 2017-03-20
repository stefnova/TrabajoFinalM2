//
//  ViewController.swift
//  TrabajoFinalM2
//
//  Created by Rocío Córdova on 19/03/17.
//  Copyright © 2017 Rocío Córdova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    @IBOutlet weak var contenedor: UIView!
    
    var pageViewController: UIPageViewController?
    
    var parametro:Item!
    
    var imagen:UIImage!
    
    var nombre:String!
    
    var costo:Double!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.pageViewController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        self.pageViewController!.delegate = self
        
        let startingViewController: ViewController2 = self.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        
        self.pageViewController!.dataSource = self
        
        self.addChildViewController(self.pageViewController!)
        
        self.contenedor.addSubview(self.pageViewController!.view)
        
        var pageViewRect = self.contenedor.bounds
        if UIDevice.current.userInterfaceIdiom == .pad {
            pageViewRect = pageViewRect.insetBy(dx: 40.0, dy: 40.0)
        }
        self.pageViewController!.view.frame = pageViewRect
        
        self.pageViewController!.didMove(toParentViewController: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        if (orientation == .portrait) || (orientation == .portraitUpsideDown) || (UIDevice.current.userInterfaceIdiom == .phone) {
            // In portrait orientation or on iPhone: Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to true, so set it to false here.
            let currentViewController = self.pageViewController!.viewControllers![0]
            let viewControllers = [currentViewController]
            self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in })
            
            self.pageViewController!.isDoubleSided = false
            return .min
        }
        
        let currentViewController = self.pageViewController!.viewControllers![0] as! ViewController2
        var viewControllers: [UIViewController]
        
        let indexOfCurrentViewController = self.indexOfViewController(currentViewController)
        if (indexOfCurrentViewController == 0) || (indexOfCurrentViewController % 2 == 0) {
            let nextViewController = self.pageViewController(self.pageViewController!, viewControllerAfter: currentViewController)
            viewControllers = [currentViewController, nextViewController!]
        } else {
            let previousViewController = self.pageViewController(self.pageViewController!, viewControllerBefore: currentViewController)
            viewControllers = [previousViewController!, currentViewController]
        }
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in })
        
        return .mid
    }

    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> ViewController2? {
        // Return the data view controller for the given index.
        if (items.count == 0) || (index >= items.count) {
            return nil
        }
        
        let ViewController2 = storyboard.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        ViewController2.dataObject = items[index]
        return ViewController2
    }
    
    func indexOfViewController(_ viewController: ViewController2) -> Int {
        
        return items.index(of: viewController.dataObject) ?? NSNotFound
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! ViewController2)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! ViewController2)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        
        if index == items.count{
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }




}

