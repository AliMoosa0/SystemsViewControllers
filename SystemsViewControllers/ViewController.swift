//
//  ViewController.swift
//  SystemsViewControllers
//
//  Created by ALI MOOSA on 01/12/2022.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    
    
    
    //MARK: - share button functions
    @IBAction func shareBtn(_ sender: UIButton) {
        guard let image = imgView.image else{return}
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        present(activityController, animated: true, completion: nil)
        
        
    }
    
    //MARK: - safari button functions
    @IBAction func safariBtn(_ sender: UIButton) {
        if let url = URL(string: "https://developer.apple.com/"){
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
            
            
        }
        
    }
    
    //MARK: - camera button functions
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
            action in imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        })
            alertController.addAction(photoLibraryAction)
            
        }
        

        
        
        alertController.popoverPresentationController?.sourceView = sender
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    //MARK: - to change the pic to the sected form the album
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any ] ){
        guard let selectedImage = info[.originalImage] as? UIImage else{return}
        
        imgView.image = selectedImage
        dismiss(animated: true, completion: nil)
        
    }
    //MARK: - when the use clicks cancel
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController,
                 didFinishPickerMediaWithInfo info:
         
                        [UIImagePickerController.InfoKey: Any ]) {
        guard let selectedImage = info[.originalImage] as?
                UIImage else {return}
        imgView.image = selectedImage
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    //MARK: - E-MAIL button
    
    @IBAction func emailBtn(_ sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else {return}
        
        let mailComposter = MFMailComposeViewController()
        mailComposter.mailComposeDelegate = self
        
        mailComposter.setToRecipients(["alm9ly@gmail.com"])
        mailComposter.setSubject("LOOK AT THiS !!")
        mailComposter.setMessageBody("HELLO, THIS IS AN EMAIL FROM THE APPLICATION I'VE CREATED", isHTML: false)
        
        
        if let image = imgView.image , let jpegData = image.jpegData(compressionQuality: 0.9){
            mailComposter.addAttachmentData(jpegData, mimeType: "image/jpeg", fileName: "photo.jpg")
            
        }
        
        present(mailComposter, animated: true, completion: nil)
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

