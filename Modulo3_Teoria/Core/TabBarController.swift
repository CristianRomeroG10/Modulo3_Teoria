//
//  tabBarController.swift
//  Modulo3_Teoria
//
//  Created by Cristian guillermo Romero garcia on 16/09/26.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews(){
        
        //MARK: FirstView
        let firstView = FirstView()
        firstView.tabBarItem.title = "List"
        firstView.tabBarItem.image = UIImage(systemName: "list.bullet.circle")
        firstView.tabBarItem.selectedImage = UIImage(systemName: "list.bullet.circle.fill")
        
        //MARK: FirstView
        let secondView = SecondView()
        secondView.tabBarItem.title = "Search"
        secondView.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        secondView.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
        
        //MARK: FirstView
        let thirdView = ThirdView()
        thirdView.tabBarItem.title = "Favorites"
        thirdView.tabBarItem.image = UIImage(systemName: "heart.circle")
        thirdView.tabBarItem.selectedImage = UIImage(systemName: "heart.circle.fill")
        
        //MARK: ViewControllers ARRAY
        let viewControllers: [UIViewController] = [firstView, secondView, thirdView]
        self.viewControllers = viewControllers
        self.selectedIndex = 0
//        self.tabBar.backgroundColor = .systemBackground
    }
    
    
}
