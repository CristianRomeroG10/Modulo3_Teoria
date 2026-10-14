//
//  FirstViewController.swift
//  Modulo3_Teoria
//
//  Created by Cristian guillermo Romero garcia on 16/09/26.
//

import UIKit

var favoriteCharacters: [charactersModel] = []

class CharactersViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet private weak var listTableView: UITableView! 
    
    // MARK: - Properties
    private let viewModel = TableViewModel()
    private let defaultCellIdentifier = "DefaultCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Personajes"
        listTableView.rowHeight = UITableView.automaticDimension
        listTableView.estimatedRowHeight = 64
        setUpView()
    }
    
    private func setUpView() {
        listTableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
        listTableView.delegate = self
        listTableView.dataSource = self
        // Si el buscador quedó como pie, lo retiramos de ahí.
        if listTableView.tableFooterView === searchBar {
            listTableView.tableFooterView = nil
        }
        
        searchBar.sizeToFit()
        listTableView.tableHeaderView = searchBar
        searchBar.delegate = self
        viewModel.filterCharacters(with: "")
        listTableView.reloadData()
        listTableView.keyboardDismissMode = .onDrag
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension CharactersViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as? CharacterTableViewCell else { return UITableViewCell() }
        let character = viewModel.getCharacters(index: indexPath.row)
        cell.configure(with: character)
        return cell
    }
}

extension CharactersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let charactersDetailViewController = CharactersDetailViewController()
        charactersDetailViewController.character = viewModel.getCharacters(index: indexPath.row)
        navigationController?.pushViewController(charactersDetailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Bob Esponja"
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addFavorite = UIContextualAction(style: .normal, title: "Favorito") { _, _, completion in
            
            let character = self.viewModel.characters[indexPath.row]
            
            if !favoriteCharacters.contains(where: {$0.alias == character.alias}){
                favoriteCharacters.append(character)
            }
            
            print("Favoritos guardados: \(favoriteCharacters.count)")
            completion(true)
        }
        
        addFavorite.image = UIImage(systemName: "heart.fill")
        addFavorite.backgroundColor = .systemPink
        
        let configuration = UISwipeActionsConfiguration(actions: [addFavorite])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
    
}

extension CharactersViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterCharacters(with: searchText)
        listTableView.reloadData()
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
