//
//  CollectionViewController.swift
//  AlbumViewer
//
//  Created by Matt Dias on 10/22/16.
//
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    var albums: [Album]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UINib(nibName: "CollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifier)

        Network.getAlbums { (albums) in
            self.albums = albums

            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }



    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albums?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell

        // Configure the cell
        cell.album = albums?[indexPath.row]

        return cell
    }
}
