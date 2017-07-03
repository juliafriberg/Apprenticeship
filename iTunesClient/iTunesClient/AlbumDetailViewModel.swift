//
//  AlbumDetailViewModel.swift
//  iTunesClient
//
//  Created by Julia Friberg on 2017-05-19.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import Foundation

struct AlbumDetailViewModel {
    let title: String
    let releaseDate: String
    let genre: String
    
}

extension AlbumDetailViewModel {
    init(album: Album) {
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        
        formatter.dateFormat = "MMM dd, yyyy"
        self.releaseDate = formatter.string(from: album.releaseDate)
    }
}
