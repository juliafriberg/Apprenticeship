//
//  SongCell.swift
//  iTunesClient
//
//  Created by Julia Friberg on 2017-05-19.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {
    
    static let reuseIdentifier = "SongCell"

    @IBOutlet weak var songRuntimeLabel: UILabel!
    @IBOutlet weak var songTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
