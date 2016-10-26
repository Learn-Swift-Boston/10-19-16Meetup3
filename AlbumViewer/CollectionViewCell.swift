//
//  CollectionViewCell.swift
//  AlbumViewer
//
//  Created by Matt Dias on 10/23/16.
//
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumYearLabel: UILabel!

    var album: Album? {
        didSet {
            if let album = album {
                Network.getArtwork(urlString: album.artWorkUrlString) { (imageData) in
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: imageData!)
                    }
                }
            }
        }
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                albumTitleLabel.text = album?.title ?? ""
                albumYearLabel.text = album?.year ?? ""
            } else {
                albumTitleLabel.text = ""
                albumYearLabel.text = ""
            }
        }
    }
}
