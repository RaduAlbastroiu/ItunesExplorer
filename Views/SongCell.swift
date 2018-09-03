//
//  SongCell.swift
//  iTunesClient
//
//  Created by Radu Albastroiu on 31/08/2018.
//  Copyright © 2018 Radu Albastroiu. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    static var reuseIdentifier = "SongCell"
    
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var trackLengthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with viewModel: SongViewModel) {
        self.songNameLabel.text = viewModel.title
        self.trackLengthLabel.text = viewModel.trackLenght
    }

}
