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
        let listNavigation = UINavigationController(rootViewController: listViewController)
        listNavigation.tabBarItem.title = "List"
        listNavigation.tabBarItem.image = UIImage(systemName: "list.bullet.circle")
        listNavigation.tabBarItem.selectedImage = UIImage(systemName: "list.bullet.circle.fill")
        listNavigation.navigationBar.prefersLargeTitles = true
        
        //MARK: FirstView
        let searchViewController = SearchViewController()
        let searchNavigation = UINavigationController(rootViewController: searchViewController)
        searchNavigation.tabBarItem.title = "Search"
        searchNavigation.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        searchNavigation.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
        searchNavigation.navigationBar.prefersLargeTitles = true
        
        //MARK: FirstView
        let favoritesViewController = FavoritesViewController()
        let favoriteNavigation = UINavigationController(rootViewController: favoritesViewController)
        favoriteNavigation.tabBarItem.title = "Favorites"
        favoriteNavigation.tabBarItem.image = UIImage(systemName: "heart.circle")
        favoriteNavigation.tabBarItem.selectedImage = UIImage(systemName: "heart.circle.fill")
        favoriteNavigation.navigationBar.prefersLargeTitles = false
        
        //MARK: ViewControllers ARRAY
        let viewControllers: [UIViewController] = [listNavigation, searchNavigation, favoriteNavigation]
        self.viewControllers = viewControllers
        self.selectedIndex = 0
//        self.tabBar.backgroundColor = .systemBackground
    }
    
    
}
