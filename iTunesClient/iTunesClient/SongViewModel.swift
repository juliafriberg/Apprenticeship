//
//  SongViewModel.swift
//  iTunesClient
//
//  Created by Julia Friberg on 2017-05-19.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import Foundation

struct SongViewModel {
    let title: String
    let runtime: String
}

extension SongViewModel {
    init(song: Song) {
        self.title = song.censoredName
        
        // Track time in milliseconds
        let timeInSeconds = song.trackTime/1000
        let minutes = timeInSeconds/60 % 60
        let seconds = timeInSeconds % 60
        
        self.runtime = "\(minutes):\(seconds)"
    }
}
