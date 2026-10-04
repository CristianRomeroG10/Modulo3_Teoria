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
        
        //MARK: characters view
        let listViewStoryboard = UIStoryboard(name: "ListViewStoryboard",bundle: nil)
        let listViewController = listViewStoryboard.instantiateViewController(withIdentifier: "ListVC") as! ListViewController
        let listNavigation = UINavigationController(rootViewController: listViewController)
        listNavigation.tabBarItem.title = "Personajes"
        listNavigation.tabBarItem.image = UIImage(systemName: "person.2.circle")
        listNavigation.tabBarItem.selectedImage = UIImage(systemName: "person.2.circle.fill")
        listNavigation.navigationBar.prefersLargeTitles = true
        
        //MARK: FavoritesView
        let favoritesViewController = FavoritesViewController()
        let favoriteNavigation = UINavigationController(rootViewController: favoritesViewController)
        favoriteNavigation.tabBarItem.title = "Favoritos"
        favoriteNavigation.tabBarItem.image = UIImage(systemName: "heart.circle")
        favoriteNavigation.tabBarItem.selectedImage = UIImage(systemName: "heart.circle.fill")
        favoriteNavigation.navigationBar.prefersLargeTitles = false
        
        //MARK: ViewControllers ARRAY
        let viewControllers: [UIViewController] = [listNavigation, favoriteNavigation]
        self.viewControllers = viewControllers
        self.selectedIndex = 0
//        self.tabBar.backgroundColor = .systemBackground
    }
    
    
}
