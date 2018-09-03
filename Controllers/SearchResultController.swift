//
//  SearchResultController.swift
//  iTunesClient
//
//  Created by Radu Albastroiu on 31/08/2018.
//  Copyright © 2018 Radu Albastroiu. All rights reserved.
//

import UIKit

class SearchResultController: UITableViewController {

    // add search bar with this controller
    let searchController = UISearchController(searchResultsController: nil)
    let dataSource = SearchResultDataSource()
    let client = ItunesAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchResultController.dismissSearchResultController))
        
        tableView.tableHeaderView = searchController.searchBar
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        
        tableView.dataSource = dataSource
    }

    @objc func dismissSearchResultController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAlbums" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let artist = dataSource.artist(at: indexPath)
                let destination = segue.destination as! AlbumListController
                
                client.lookupArtist(withId: artist.id) { (artist, error) in
                    destination.artist = artist
                    destination.tableView.reloadData()
                }
            }
        }
    }
}

extension SearchResultController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        client.searchForArtist(withTerm: searchController.searchBar.text!) { [weak self] (artists, error) in
            self?.dataSource.update(with: artists)
            self?.tableView.reloadData()
        }
    }
}
