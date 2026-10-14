//
//  FavoritesTableViewCell.swift
//  Modulo3_Teoria
//
//  Created by Cristian Guillermo Romero Garcia on 12/10/26.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "FavoriteCell"
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        accessoryType = .disclosureIndicator
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        characterImage.layer.cornerRadius = characterImage.bounds.width/2
    }

    func configuration(with character: charactersModel){
        characterImage.image = UIImage(named: character.image)
        nameLabel.text = character.alias
        descriptionLabel.text = "\(character.species) · \(character.occupation)"
    }
    
}
