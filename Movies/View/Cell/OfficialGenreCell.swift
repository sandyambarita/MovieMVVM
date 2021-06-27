//
//  OfficialGenreCell.swift
//  Movies
//
//  Created by Sandy Ambarita on 26/06/21.
//

import UIKit

class OfficialGenreCell: UITableViewCell {

    @IBOutlet weak var lblGendre: UILabel!
    
    func configureCell(data: GenreData) {
        lblGendre.text = data.name
    }
    
}
