//
//  Album.swift
//  iTunesClient
//
//  Created by Radu Albastroiu on 29/08/2018.
//  Copyright © 2018 Radu Albastroiu. All rights reserved.
//

import Foundation
import UIKit

enum AlbumArtworkState {
    case placeholder
    case downloaded
    case failed
}

class Album {
    let id: Int
    let artistName: String
    let name: String
    let censoredName: String
    let artworkURL: String
    let isExplicit: Bool
    let numberOfTracks: Int
    let releaseDate: Date
    let primaryGenre: Genre
    var songs = [Song]()
    var artwork: UIImage?
    var artworkState = AlbumArtworkState.placeholder
    
    init(id: Int, artistName: String, name: String, censoredName: String, artworkURL: String, isExplicit: Bool, numberOfTracks: Int, releaseDate: Date, genre: Genre) {
        
        self.id = id
        self.artistName = artistName
        self.name = name
        self.censoredName = censoredName
        self.artworkURL = artworkURL
        self.isExplicit = isExplicit
        self.numberOfTracks = numberOfTracks
        self.releaseDate = releaseDate
        self.primaryGenre = genre
    }
}

extension Album {
    convenience init?(json: [String: Any]) {
        
        struct Key {
            static let id = "collectionId"
            static let artistName = "artistName"
            static let name = "collectionName"
            static let censoredName = "collectionCensoredName"
            static let artworkUrl = "artworkUrl100"
            static let collectionExplicitness = "collectionExplicitness"
            static let trackCount = "trackCount"
            static let releaseDate = "releaseDate"
            static let primaryGenre = "primaryGenreName"
        }
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        guard let idValue = json[Key.id] as? Int,
            let artistNameValue = json[Key.artistName] as? String,
            let nameValue = json[Key.name] as? String,
            let censoredNameValue = json[Key.censoredName] as? String,
            let artworkUrlString = json[Key.artworkUrl] as? String,
            let isExplicitValue = json[Key.collectionExplicitness] as? String,
            let numberOfTracksValue = json[Key.trackCount] as? Int,
            let releaseDateString = json[Key.releaseDate] as? String,
            let releaseDateValue = formatter.date(from: releaseDateString),
            let primaryGenreString = json[Key.primaryGenre] as? String,
            let primaryGenreValue = Genre(name: primaryGenreString) else { return nil }
        
        let isExplicit = isExplicitValue == "notExplicit" ? false : true
        
        self.init(id: idValue, artistName: artistNameValue, name: nameValue, censoredName: censoredNameValue, artworkURL: artworkUrlString, isExplicit: isExplicit, numberOfTracks: numberOfTracksValue, releaseDate: releaseDateValue, genre: primaryGenreValue)
    }
}
