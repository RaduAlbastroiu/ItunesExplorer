//
//  AlbumListController.swift
//  iTunesClient
//
//  Created by Radu Albastroiu on 31/08/2018.
//  Copyright © 2018 Radu Albastroiu. All rights reserved.
//

import UIKit

class AlbumListController: UITableViewController {

    private struct Constants {
        static let AlbumCellHeight = 80
    }
    
    var artist: Artist? {
        didSet{
            self.title = artist?.name
            dataSource.update(with: artist!.albums)
            tableView.reloadData()
        }
    }
    
    lazy var dataSource: AlbumListDataSource = {
        return AlbumListDataSource(albums: [], tableView: self.tableView)
    }()
    
    let client = ItunesAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }

    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.AlbumCellHeight)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAlbum" {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                let selectedAlbum = dataSource.album(at: selectedIndexPath)
                
                let albumDetailController = segue.destination as! AlbumDetailController
                
                client.lookupAlbum(withId: selectedAlbum.id) {  album, error in
                    albumDetailController.album = album
                }
            }
        }
    }
}
