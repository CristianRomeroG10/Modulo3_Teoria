//
//  FavoritesViewController.swift
//  Modulo3_Teoria
//
//  Created by Cristian guillermo Romero garcia on 18/09/26.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var favoritesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoritesTableView.reloadData()
    }
    
    private func setUpView(){
        title = "Favorites"
        view.backgroundColor = .systemBackground
        favoritesTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: FavoritesTableViewCell.reuseIdentifier)
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self
        favoritesTableView.rowHeight = UITableView.automaticDimension
        favoritesTableView.estimatedRowHeight = 75
    }
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.reuseIdentifier, for: indexPath) as? FavoritesTableViewCell else {
            return UITableViewCell()
        }
        let character = favoriteCharacters[indexPath.row]
        cell.configuration(with: character)
        return cell
    }
    
    
}

extension FavoritesViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        100
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let charactersDetailView = CharactersDetailViewController()
        charactersDetailView.character = favoriteCharacters[indexPath.row]
        self.navigationController?.pushViewController(charactersDetailView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteFavorite = UIContextualAction(style: .destructive, title: "Eliminar") { _, _, completion in
            favoriteCharacters.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        
        deleteFavorite.image = UIImage(systemName: "trash")
        
        let configuration = UISwipeActionsConfiguration(
            actions: [deleteFavorite]
        )
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
}
