//
//  Network.swift
//  AlbumViewer
//
//  Created by Matt Dias on 10/22/16.
//
//

import Foundation

struct Network {

    static func getAlbums(completion: @escaping ([Album]) -> ()) {
        let url = URL(string: "https://itunes.apple.com/search?term=the+beatles&limit=25")

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in

            var stuffToReturn = [Album]()

            if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! [String: Any],
                let items = json["results"] as? [[String: Any]] {

                items.forEach({ (item) in
                    if let album = Album(json: item) {
                        stuffToReturn.append(album)
                    }
                })

                completion(stuffToReturn)
                return
            }

            completion([])  // empty array because something went wrong
        }
        
        task.resume()
    }

    static func getArtwork(urlString: String, completion: @escaping (Data?) -> ()) {
        let url = URL(string: urlString)

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in

            if error == nil {
                completion(data)
            } else {
                print("image download failed:\n\(error)")
            }
        }

        task.resume()
    }
}
