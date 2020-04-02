//
//  LoginHomeViewController.swift
//  CTEx
//
//  Created by Murat Bekgi on 3/3/20.
//  Copyright © 2020 Murat Bekgi. All rights reserved.
//

import UIKit

class LoginHomeViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBAction func imageImport(_ sender: Any) {
        
        let imagePickerController  = UIImagePickerController()
            imagePickerController.delegate = self
            
            let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: . actionSheet)
            
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .default,handler: { (action:UIAlertAction) in
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    imagePickerController.sourceType = .camera
                 self.present(imagePickerController, animated: true, completion: nil)
                }else{
                    print("Camera is not available")
                }
            }))
            
            actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default,handler: { (action:UIAlertAction) in
                 imagePickerController.sourceType = .photoLibrary
                self.present(imagePickerController, animated: true, completion: nil)
            }))
                   
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(actionSheet, animated: true, completion: nil)
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            
            ImageView.image = image
            picker.dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
