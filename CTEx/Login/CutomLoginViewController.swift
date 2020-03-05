//
//  LoginViewController.swift
//  CTEx
//
//  Created by Murat Bekgi on 3/3/20.
//  Copyright © 2020 Murat Bekgi. All rights reserved.
//

import UIKit

class CustomLoginViewController: UIViewController {

    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }

    func setUpElements()  {
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
        
        
}
    

   
   

}
