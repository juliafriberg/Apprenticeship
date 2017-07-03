//
//  ViewController.swift
//  iTunesClient
//
//  Created by Julia Friberg on 2017-05-18.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchEndpoint = Itunes.search(term: "taylor swift", mediaType: .music(entity: .musicArtist, attribute: .artistTerm))
        print(searchEndpoint.request)
        
        print("******************************")
        
        let lookupEndpoint = Itunes.lookup(id: 159260351, entity: MusicEntity.album)
        print(lookupEndpoint.request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

