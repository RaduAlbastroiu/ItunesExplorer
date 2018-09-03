//
//  AlbumDetailController.swift
//  iTunesClient
//
//  Created by Radu Albastroiu on 31/08/2018.
//  Copyright © 2018 Radu Albastroiu. All rights reserved.
//

import UIKit

class AlbumDetailController: UITableViewController {

    var album: Album? {
        didSet {
            if let album = album {
                configure(with: album)
                dataSource.update(with: album.songs)
                tableView.reloadData()
            }
        }
    }
    
    var dataSource = AlbumDetailDataSource(songs: [])
    
    @IBOutlet weak var artWorkView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let album = self.album {
            configure(with: album)
        }
        
        tableView.dataSource =  dataSource
        tableView.delegate = self
    }
    
    func configure(with album: Album) {
        let viewModel = AlbumDetailViewModel(from: album)
        
        // FIXME: Add implementation for artworkView
        self.albumNameLabel.text = viewModel.title
        self.genreLabel.text = viewModel.genre
        self.releaseDateLabel.text = viewModel.releaseDate
    }
}
