//
//  ContactTableViewCell.swift
//  Modulo3_Teoria
//
//  Created by Cristian guillermo Romero garcia on 19/09/26.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    //MARK: OUTLETS
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var specieLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!

    public static let reuseIdentifier = "contactCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(characters: [charactersModel], index: Int){
        characterImage.image = UIImage(named: "")
        nameLabel.text = characters[index].fullName
        specieLabel.text = characters[index].species
        occupationLabel.text = characters[index].occupation
    }
    
    
    
}
