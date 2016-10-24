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
//    var selectedCell: CollectionViewCell?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UINib(nibName: "CollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        Network.getAlbums { (albums) in

            self.albums = albums
            self.collectionView?.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

        Network.getArtwork(urlString: albums![indexPath.row].artWorkUrlString) { (imageData) in
            DispatchQueue.main.async {
                cell.imageView.image = UIImage(data: imageData!)
            }
        }

        if cell.isSelected {
            cell.albumTitleLabel.text = self.albums![indexPath.row].title
            cell.albumYearLabel.text = self.albums![indexPath.row].year
            return cell
        } else {
            cell.albumTitleLabel.text = ""
            cell.albumYearLabel.text = ""
        }

        return cell
    }


    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let cell = self.collectionView(self.collectionView!, cellForItemAt: indexPath) as? CollectionViewCell {
            cell.albumTitleLabel.text = self.albums?[indexPath.row].title
            cell.albumYearLabel.text = self.albums?[indexPath.row].year
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {

        if let cell = self.collectionView(self.collectionView!, cellForItemAt: indexPath) as? CollectionViewCell {
            cell.albumTitleLabel.text = ""
            cell.albumYearLabel.text = ""
        }
    }
}
