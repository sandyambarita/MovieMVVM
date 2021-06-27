//
//  DiscoverMovieCell.swift
//  Movies
//
//  Created by Sandy Ambarita on 26/06/21.
//

import UIKit

class DiscoverMovieCell: UITableViewCell {

    @IBOutlet weak var lblDiscover: UILabel!
    @IBOutlet weak var lblRelaseDate: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    
    func configureCell(data: DiscoverData) {
        lblDiscover.text = data.title
        lblRelaseDate.text = data.releaseDate?.formatDate()
        imgPoster.loadFromUrl(path: data.posterPath ?? "")
    }
    
}
