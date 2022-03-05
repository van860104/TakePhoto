//
//  ViewController.swift
//  TakePhoto
//
//  Created by 1 on 2022/3/5.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imagPhoto: UIImageView!
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    
    @IBAction func btnTakePhoto(_ sender: Any){
        showPhotoAlert()
    }
    func showPhotoAlert(){
        let alert = UIAlertController(title: "take photo frome:", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler:{action in
            self.getPhoto(type: .camera)
    }))
        alert.addAction(UIAlertAction(title: "Photo Libary", style: .default, handler:{action in
            self.getPhoto(type: .photoLibrary)
    }))
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    func getPhoto(type: UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = false
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo Info:[UIImagePickerController.InfoKey: Any]) {
        dismiss(animated: true, completion: nil)

        guard let image = Info[.originalImage]as? UIImage else{
            
            print("image not found")
            return
        }
        imagPhoto.image = image
    }
    func imagePickerController(_ picker:UIImagePickerController){
        dismiss(animated: true, completion: nil)
    }
}
