//
//  AlbumListController.swift
//  iTunesClient
//
//  Created by Julia Friberg on 2017-05-18.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import UIKit

class AlbumListController: UITableViewController {
    let client = ItunesAPIClient()
    
    private struct Constants {
        static let AlbumCellHeight: CGFloat = 80
        
    }
    
    var artist: Artist? {
        didSet {
            self.title = artist?.name
            dataSource.update(with: artist!.albums)
            tableView.reloadData()
        }
    }
    
    lazy var dataSource: AlbumListDataSource = {
        return AlbumListDataSource(albums: [], tableView: self.tableView)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.AlbumCellHeight
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbum" {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                let selectedAlbum = dataSource.album(at: selectedIndexPath)
                let albumDetailController = segue.destination as! AlbumDetailController
                
                
                client.lookupAlbum(withId: selectedAlbum.id) { album, error in
                    albumDetailController.album = album
                    
                }
                
                
            }
        }
    }

    
}
