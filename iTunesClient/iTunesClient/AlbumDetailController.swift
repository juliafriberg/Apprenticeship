//
//  AlbumDetailController.swift
//  iTunesClient
//
//  Created by Julia Friberg on 2017-05-19.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import UIKit

class AlbumDetailController: UITableViewController {
    
    
    var album: Album? {
        didSet {
            if let album = album {
                configure(with: album)
                dataSource.update(with: album.songs)
                tableView.reloadData()
            }
            
        }
    }
    
    var dataSource = AlbumDetailDataSource(songs: [])

    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        
    }
   
    func configure(with album: Album) {
        let viewModel = AlbumDetailViewModel(album: album)
        
        // Add implementation for artworkView
        
        albumTitleLabel.text = viewModel.title
        genreLabel.text = viewModel.genre
        releaseDateLabel.text = viewModel.releaseDate
    }
    
    

}
