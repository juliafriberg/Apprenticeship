//
//  ContactDetailController.swift
//  Contacts
//
//  Created by Julia Friberg on 2017-05-30.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import UIKit

protocol ContactDetailControllerDelegate: class {
    func didMarkAsFavoriteContact(_ contact: Contact)
}

class ContactDetailController: UITableViewController {
    
    var contact: Contact?
    
    //Outlets
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    weak var delegate: ContactDetailControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    func configureView() {
        guard let contact = contact else { return }
        imageView.image = contact.image
        nameLabel.text = "\(contact.firstName) \(contact.lastName)"
        phoneNumberLabel.text = contact.phone
        emailLabel.text = contact.email
        streetLabel.text = contact.street
        cityLabel.text = contact.city
        stateLabel.text = contact.state
        zipCodeLabel.text = contact.zip
    }
    
    @IBAction func markAsFavorite(_ sender: Any) {
        guard let contact = contact else { return }
        delegate?.didMarkAsFavoriteContact(contact)
    }
}
