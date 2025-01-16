//
//  ViewController.swift
//  BottomSheetAboveNavigationBar
//
//  Created by Elexoft on 16/01/2025.
//

import UIKit

class ViewController: UIViewController {
    
    var bottomSheet: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the bottom sheet
        setupBottomSheet()
    }

    func setupBottomSheet() {
        // Create the Bottom Sheet view
        bottomSheet = UIView()
        bottomSheet.backgroundColor = .systemBlue
        bottomSheet.layer.cornerRadius = 10
        let bottomSheetHeight: CGFloat = 300
        
        // Get the Tab Bar height and Safe Area Insets
        let tabBarHeight = self.tabBarController?.tabBar.frame.height ?? 0
        let safeAreaBottomInset = self.view.safeAreaInsets.bottom
        
        // Calculate the final Y position to make sure the bottom sheet appears above the tab bar
        let finalYPosition = self.view.frame.height - tabBarHeight - bottomSheetHeight - safeAreaBottomInset
        
        // Set the initial position of the bottom sheet (off-screen, below the view)
        bottomSheet.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: bottomSheetHeight)
        
        // Add a swipe-down gesture to dismiss the bottom sheet
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissBottomSheet))
        swipeDownGesture.direction = .down
        bottomSheet.addGestureRecognizer(swipeDownGesture)
        
        // Add the bottom sheet to the view hierarchy
        self.view.addSubview(bottomSheet)
        
        // Animate the Bottom Sheet up above the tab bar
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomSheet.frame.origin.y = finalYPosition
        })
    }

    @objc func dismissBottomSheet() {
        // Animate the Bottom Sheet off the screen
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomSheet.frame.origin.y = self.view.frame.height
        })
    }
}
