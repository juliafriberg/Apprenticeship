//
//  TillsammansCup
//
//  Created by Julia Friberg on 2017-04-05.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var isLoggedIn: Bool = false;

    @IBOutlet weak var codeField: UITextField!
    
    
    @IBAction func login(_ sender: UIButton) {
        
        let code = codeField.text
        print(code ?? "")
       
        //TODO: Log in with code
        
        isLoggedIn = true;
        if self.parent is TeamContainerController {
            (self.parent as! TeamContainerController).updateView()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        codeField.resignFirstResponder()
        super.touchesBegan(touches, with: event)
    }
    
    

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        codeField.resignFirstResponder()
        return true
    }
    
}

