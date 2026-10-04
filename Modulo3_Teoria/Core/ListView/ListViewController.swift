//
//  FirstViewController.swift
//  Modulo3_Teoria
//
//  Created by Cristian guillermo Romero garcia on 16/09/26.
//

import UIKit

class ListViewController: UIViewController {
    
    // MARK: - Outlets
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
    }
}

extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier)
        ?? UITableViewCell(style: .subtitle, reuseIdentifier: defaultCellIdentifier)
        let character = viewModel.characters[indexPath.row]
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
        charactersDetailViewController.character = viewModel.characters[indexPath.row]
        navigationController?.pushViewController(charactersDetailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Bob Esponja"
    }
}
