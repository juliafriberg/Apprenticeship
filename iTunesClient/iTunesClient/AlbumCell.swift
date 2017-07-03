//
//  AlbumCell.swift
//  iTunesClient
//
//  Created by Julia Friberg on 2017-05-18.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    static let reuseIdentifier = "AlbumCell"
    
    
    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!

    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with viewModel: AlbumCellViewModel) {
        artworkView.image = viewModel.artwork
        albumTitleLabel.text = viewModel.title
        releaseDateLabel.text = viewModel.releaseDate
        genreLabel.text = viewModel.genre
    }

}
