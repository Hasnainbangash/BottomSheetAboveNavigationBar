//
//  ViewController.swift
//  BottomSheetAboveNavigationBar
//
//  Created by Elexoft on 16/01/2025.
//

import UIKit
import FloatingPanel

class ViewController: UIViewController, FloatingPanelControllerDelegate {
    
    var fpc: FloatingPanelController?

        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Initialize the FloatingPanelController object.
            fpc = FloatingPanelController()
            fpc?.delegate = self
            
            // Create the content view controller from storyboard (SecondViewController).
            let contentVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
            
            // Set the content view controller for the floating panel.
            fpc?.set(contentViewController: contentVC)
            
            // Optionally, track a scroll view if your content is scrollable.
            // fpc?.track(scrollView: contentVC.tableView)
            
            // Add the floating panel to the parent view.
            fpc?.addPanel(toParent: self)
            
            // Customize the floating panel if needed.
            fpc?.surfaceView.backgroundColor = .white // You can set a background color
//            fpc?.surfaceView.shadowHidden = false      // Show shadow for the panel
            
        }
}
