//
//  Network.swift
//  AlbumViewer
//
//  Created by Matt Dias on 10/22/16.
//
//

import Foundation

struct Network {

    func getAlbums() {
        let url = URL(string: "https://itunes.apple.com/search?term=the+beatles&limit=25")

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!){data,response,error in

            dump(response)
        }
        
        task.resume()
    }
}
