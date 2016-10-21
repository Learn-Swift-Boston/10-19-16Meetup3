//
//  Network.swift
//  AlbumViewer
//
//  Created by Matt Dias on 10/19/16.
//
//

import Foundation

struct Network {

	func getAlbums(completion: @escaping ([String])->()) {
		let url = URL(string: "https://itunes.apple.com/search?term=the+beatles&limit=25")

		let session = URLSession(configuration: .default)
		let task = session.dataTask(with: url!){data,response,error in

			var stuffToReturn: [String] = []

			let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! [String: Any]

			if let items = json!["results"] as? [[String: Any]] {
				items.forEach({ (item) in
					if let urlString = item["artworkUrl60"] as? String {
						stuffToReturn.append(urlString)
					}
				})
				completion(stuffToReturn)
			}

		}

		task.resume()
	}
}
