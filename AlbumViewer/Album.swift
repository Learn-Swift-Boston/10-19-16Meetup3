//
//  Album.swift
//  AlbumViewer
//
//  Created by Matthew Dias on 10/23/16.
//
//

import Foundation


struct Album {
    var title: String
    var year: String
    var artWorkUrlString: String


    init?(json: [String: Any]) {
        guard let title = json["collectionName"] as? String,
              let dateString = json["releaseDate"] as? String,
              let artWorkUrlString = json["artworkUrl100"] as? String else {
                return nil
        }

        self.title = title
        self.year = dateString.substring(to: dateString.index(dateString.startIndex, offsetBy: 3))
        self.artWorkUrlString = artWorkUrlString
    }
}
