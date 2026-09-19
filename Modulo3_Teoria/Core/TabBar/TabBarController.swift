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
        let listViewStoryboard = UIStoryboard(name: "ListViewStoryboard",bundle: nil)
        let listViewController = listViewStoryboard.instantiateViewController(withIdentifier: "ListVC") as! ListViewController
        listViewController.tabBarItem.title = "List"
        listViewController.tabBarItem.image = UIImage(systemName: "list.bullet.circle")
        listViewController.tabBarItem.selectedImage = UIImage(systemName: "list.bullet.circle.fill")
        
        //MARK: FirstView
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem.title = "Search"
        searchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        searchViewController.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
        
        //MARK: FirstView
        let favoritesView = FavoritesViewController()
        favoritesView.tabBarItem.title = "Favorites"
        favoritesView.tabBarItem.image = UIImage(systemName: "heart.circle")
        favoritesView.tabBarItem.selectedImage = UIImage(systemName: "heart.circle.fill")
        
        //MARK: ViewControllers ARRAY
        let viewControllers: [UIViewController] = [listViewController, searchViewController, favoritesView]
        self.viewControllers = viewControllers
        self.selectedIndex = 0
//        self.tabBar.backgroundColor = .systemBackground
    }
    
    
}
