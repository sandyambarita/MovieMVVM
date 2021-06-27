//
//  VideoMovieCell.swift
//  Movies
//
//  Created by Sandy Ambarita on 27/06/21.
//

import UIKit

class VideoMovieCell: UICollectionViewCell {
    @IBOutlet var lblName: UILabel!
    @IBOutlet var backgroundImg: UIImageView!
    
    func configureCell(data: MovieVideoData) {
        lblName.text = data.name
    }

}
