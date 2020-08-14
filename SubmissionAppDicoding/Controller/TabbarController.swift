//
//  ViewController.swift
//  SubmissionAppDicoding
//
//  Created by Dewa Prabawa on 12/06/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialBottomNavigation

class TabbarController: UITabBarController{
    
    let bottomNavBar = MDCBottomNavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupviews()
    }
    
    
    func setupviews(){
        //MARK:- BottomNavbarMaterialDesign
        
        
        self.view.addSubview(bottomNavBar)
        bottomNavBar.delegate = self
        
        bottomNavBar.titleVisibility = MDCBottomNavigationBarTitleVisibility.selected
        bottomNavBar.alignment =  MDCBottomNavigationBarAlignment.justified
        
        let tour = UITabBarItem(title: "Tour", image: UIImage(named: "icons8-traveler-50"), tag: 0)
        let local = UITabBarItem(title: "Local", image: UIImage(named: "icons8-island-on-water-50"), tag: 1)
        let oversee = UITabBarItem(title: "Oversee", image: UIImage(named: "icons8-asia-50"), tag: 2)
        let person = UITabBarItem(title: "About", image: UIImage(named: "person"), tag: 3)
        
        bottomNavBar.selectedItemTintColor = #colorLiteral(red: 0.3073181808, green: 0.5596917272, blue: 0.6307321191, alpha: 1)
        let shadowElevation:CGFloat = 20
        bottomNavBar.elevation = ShadowElevation(rawValue: shadowElevation)
        bottomNavBar.selectedItem = tour
        bottomNavBar.items = [tour,local,oversee,person]
    }
    
    func layoutBottomNavBar() {
      let size = bottomNavBar.sizeThatFits(view.bounds.size)
      var bottomNavBarFrame = CGRect(x: 0,
                                     y: view.bounds.height - size.height,
                                     width: size.width,
                                     height: size.height)
      // Extend the Bottom Navigation to the bottom of the screen.
      if #available(iOS 11.0, *) {
        bottomNavBarFrame.size.height += view.safeAreaInsets.bottom
        bottomNavBarFrame.origin.y -= view.safeAreaInsets.bottom
      }
      bottomNavBar.frame = bottomNavBarFrame
    }

}

extension TabbarController: MDCBottomNavigationBarDelegate, MDCBottomNavigationBarControllerDelegate{
    
   
    override func viewSafeAreaInsetsDidChange() {
            layoutBottomNavBar()
    }
       
    override func viewWillLayoutSubviews() {
            layoutBottomNavBar()
    }
    

       
    func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, didSelect item: UITabBarItem) {
        selectedIndex = item.tag
        bottomNavigationBar.selectedItem = item
    }
   

}


