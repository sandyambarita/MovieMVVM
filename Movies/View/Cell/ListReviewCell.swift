//
//  ListReviewCell.swift
//  Movies
//
//  Created by Sandy Ambarita on 27/06/21.
//

import UIKit

class ListReviewCell: UITableViewCell {
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var imgAuthor: UIImageView!
    
    func configureCell(data: MovieReviewData) {
        lblAuthor.text = "A Review by \(data.authorDetails?.username ?? "")"
        lblContent.text = data.content
        imgAuthor.loadFromUrl(path: data.authorDetails?.avatarPath ?? "", contentMode: .scaleAspectFill)
    }
    
}
