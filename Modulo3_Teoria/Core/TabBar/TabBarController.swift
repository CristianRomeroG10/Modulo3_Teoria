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
        let CharactersViewStoryboard = UIStoryboard(name: "CharactersViewStoryboard",bundle: nil)
        let CharactersViewController = CharactersViewStoryboard.instantiateViewController(withIdentifier: "CharactersVC") as! CharactersViewController
        let CharactersNavigation = UINavigationController(rootViewController: CharactersViewController)
        CharactersNavigation.tabBarItem.title = "Personajes"
        CharactersNavigation.tabBarItem.image = UIImage(systemName: "person.2.circle")
        CharactersNavigation.tabBarItem.selectedImage = UIImage(systemName: "person.2.circle.fill")
        CharactersNavigation.navigationBar.prefersLargeTitles = true
        
        //MARK: FavoritesView
        let favoritesViewController = FavoritesViewController()
        let favoriteNavigation = UINavigationController(rootViewController: favoritesViewController)
        favoriteNavigation.tabBarItem.title = "Favoritos"
        favoriteNavigation.tabBarItem.image = UIImage(systemName: "heart.circle")
        favoriteNavigation.tabBarItem.selectedImage = UIImage(systemName: "heart.circle.fill")
        favoriteNavigation.navigationBar.prefersLargeTitles = false
        
        //MARK: ViewControllers ARRAY
        let viewControllers: [UIViewController] = [CharactersNavigation, favoriteNavigation]
        self.viewControllers = viewControllers
        self.selectedIndex = 0
//        self.tabBar.backgroundColor = .systemBackground
    }
    
    
}
