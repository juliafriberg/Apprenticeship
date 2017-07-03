//
//  SearchResultsDataSource.swift
//  iTunesClient
//
//  Created by Julia Friberg on 2017-05-18.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import UIKit

class SearchResultsDataSource: NSObject, UITableViewDataSource {
    
    private var data = [Artist]()
    
    override init() {
        super.init()
    }
    
    func update(with artists: [Artist]) {
        data = artists
    }
    
    // MARK: Data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        
        let artist = data[indexPath.row]
        
        cell.textLabel?.text = artist.name
        
        return cell
    }
    
    // MARK: - Helper
    
    func artist(at indexPath: IndexPath) -> Artist {
        return data[indexPath.row]
    }
    

}
