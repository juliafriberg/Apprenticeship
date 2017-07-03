//
//  FirstViewController.swift
//  TillsammansCup
//
//  Created by Julia Friberg on 2017-04-05.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import UIKit

class TeamProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamNameTextField: UITextField!
    
    let picker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        
        infoSetup()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
        print(chosenImage.size)
        
        teamImage.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func prepareActionSheet(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cameraButton = UIAlertAction(title: NSLocalizedString("takepicture", comment: ""), style: .default, handler: { (action) -> Void in
            self.uploadImage(type: UIImagePickerControllerSourceType.camera)
        })
        
        let libraryButton = UIAlertAction(title: NSLocalizedString("choosepicture", comment: ""), style: .default, handler: { (action) -> Void in
            self.uploadImage(type: UIImagePickerControllerSourceType.photoLibrary)
        })
        
        let cancelButton = UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .cancel, handler: nil)
    
        
        alertController.addAction(cameraButton)
        alertController.addAction(libraryButton)
        alertController.addAction(cancelButton)
        
        self.navigationController!.present(alertController, animated: true, completion: nil)
        
    }
    
    func uploadImage(type: UIImagePickerControllerSourceType) {
        picker.allowsEditing = true
        picker.sourceType = type
        self.present(picker, animated: true, completion: nil)
    }

    @IBAction func saveChanges(_ sender: UIButton) {
        // TODO: Save changes
    }
    
    private func infoSetup() {
        //TODO: Get info about team and show it.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        teamNameTextField.resignFirstResponder()
        super.touchesBegan(touches, with: event)
    }
}


extension TeamProfileViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        teamNameTextField.resignFirstResponder()
        return true
    }
    
}

