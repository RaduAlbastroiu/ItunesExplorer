//
//  AlbumCell.swift
//  iTunesClient
//
//  Created by Radu Albastroiu on 31/08/2018.
//  Copyright © 2018 Radu Albastroiu. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {

    static var reuseIdentifier = "AlbumCell"
    
    @IBOutlet weak var albumArtwork: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with viewModel: AlbumCellViewModel) {
        self.albumArtwork.image = viewModel.artwork
        self.albumNameLabel.text = viewModel.title
        self.genreLabel.text = viewModel.genre
        self.dateLabel.text = viewModel.releaseDate
    }

}
