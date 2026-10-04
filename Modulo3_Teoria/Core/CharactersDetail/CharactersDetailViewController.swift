//
//  CharactersDetailViewController.swift
//  Modulo3_Teoria
//
//  Created by Cristian guillermo Romero garcia on 02/10/26.
//

import UIKit

class CharactersDetailViewController: UIViewController {
    
    var character = charactersModel(image: "", name: "", lastName: "", species: "", occupation: "", description: "")
    
    private let characterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let specieLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .label
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ocupationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .label
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        navigationItem.largeTitleDisplayMode = .never
        view.addSubview(characterImage)
        view.addSubview(fullNameLabel)
        view.addSubview(specieLabel)
        view.addSubview(ocupationLabel)
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            characterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            characterImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            characterImage.heightAnchor.constraint(equalToConstant: 200),
            
            fullNameLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 32),
            fullNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: -16),
            
            specieLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 32),
            specieLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            specieLabel.widthAnchor.constraint(equalToConstant: 180),
            
            ocupationLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 32),
            ocupationLabel.leadingAnchor.constraint(equalTo: specieLabel.trailingAnchor, constant: 16),
            ocupationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: specieLabel.bottomAnchor, constant: 32),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        title = character.name
        characterImage.image = UIImage(named: character.image)
        fullNameLabel.text = "Nombre completo: \(character.fullName)"
        specieLabel.text = "Especie: \(character.species)"
        ocupationLabel.text = "Ocupación: \(character.occupation)"
        descriptionLabel.text = character.description
        
    }
    

}
