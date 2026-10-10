//
//  FirstViewController.swift
//  Modulo3_Teoria
//
//  Created by Cristian guillermo Romero garcia on 16/09/26.
//

import UIKit

class ListViewController: UIViewController {
    
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
        setUpView()
    }
    
    private func setUpView() {
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

extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier)
        ?? UITableViewCell(style: .subtitle, reuseIdentifier: defaultCellIdentifier)
        let character = viewModel.getCharacters(index: indexPath.row)
        cell.textLabel?.text = character.fullName
        cell.detailTextLabel?.text = "\(character.species) · \(character.occupation)"
        cell.imageView?.image = UIImage(named: character.image)
        cell.imageView?.layer.cornerRadius = 40
        cell.imageView?.clipsToBounds = true
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let charactersDetailViewController = CharactersDetailViewController()
        charactersDetailViewController.character = viewModel.getCharacters(index: indexPath.row)
        navigationController?.pushViewController(charactersDetailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Bob Esponja"
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterCharacters(with: searchText)
        listTableView.reloadData()
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
