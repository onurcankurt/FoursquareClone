//
//  AddPlacesVC.swift
//  FoursquareClone
//
//  Created by onur on 3.09.2023.
//

import UIKit

/*
var globalName = ""
var globalType = ""
var globalAtmosphere = ""
 */

class AddPlacesVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var placeNameText: UITextField!
    
    @IBOutlet weak var placeTypeText: UITextField!
    
    @IBOutlet weak var placeAtmosphereText: UITextField!
    
    @IBOutlet weak var placesImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        placesImageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        placesImageView.addGestureRecognizer(imageTapRecognizer)
        
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placesImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if placeNameText.text != "" && placeTypeText.text != "" && placeAtmosphereText.text != ""{
            if let chosenImage = placesImageView.image{
                
                let placeModel = PlaceModel.sharedInstance
                
                placeModel.placeName = placeNameText.text!
                placeModel.placeType = placeTypeText.text!
                placeModel.placeAtmosphere = placeAtmosphereText.text!
                placeModel.placeImage = placesImageView.image!
                
                performSegue(withIdentifier: "toMapVC", sender: nil)
                
                
            }
        } else {
            
            let alert = UIAlertController(title: "Error!", message: "Place name / type / atmosphere ?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}
