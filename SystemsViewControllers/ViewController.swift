//
//  ViewController.swift
//  SystemsViewControllers
//
//  Created by ALI MOOSA on 01/12/2022.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UIImagePickerController, UINavigationControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func shareBtn(_ sender: UIButton) {
        guard let image = imgView.image else{return}
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        present(activityController, animated: true, completion: nil)
        
        
    }
    @IBAction func safariBtn(_ sender: UIButton) {
        if let url = URL(string: "https://developer.apple.com/"){
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
            
            
        }
        
    }
    @IBAction func cameraBtn(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
            action in print("user selected camera action")
        })
            alertController.addAction(cameraAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
        let photoLibraryAction = UIAlertAction(title: "Photo library", style: .default, handler: {
            action in print("user selected Photo library action")
        })
            alertController.addAction(photoLibraryAction)
            
        }
        
        alertController.popoverPresentationController?.sourceView = sender
        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func emailBtn(_ sender: UIButton) {
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

