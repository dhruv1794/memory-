//
//  ADDINGViewController.swift
//  memory!
//
//  Created by Dhruv Mishra on 10/02/17.
//  Copyright © 2017 dhruvinity. All rights reserved.
//

import UIKit

class ADDINGViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate { //step 2
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var DeleteButton: UIButton!//step 42
    @IBOutlet weak var AddUpdate: UIButton!// step 40
    var imagePicker = UIImagePickerController()// step 1
    var memory : Memory? = nil // step 30
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self //step 3
        if memory != nil{
            imageView.image = UIImage(data: memory!.image as! Data) //step 38
            TextField.text = memory!.title // step 39
            // step 40 involves adding ADD button also as an outlet so that we can change it to update if a cell is selected in viewcontroller
            
            AddUpdate.setTitle("Update", for: .normal) // step 41
            // step 42 involves creating a new button delete
        }
        else{
            DeleteButton.isHidden = true // step 43 to hide delete
        }
    }

    @IBAction func CameraTapped(_ sender: Any) {
        // for step 56 we setup the camera button
        imagePicker.sourceType = .camera // step 57
        present(imagePicker, animated: true, completion: nil) // 57
        // step 59 involves updating info.plist
        
    }

    @IBAction func PhotosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary //step 4
        present(imagePicker, animated: true, completion: nil) //step 5
        }
    //folowing is step 7
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage //step 8
        imageView.image = image //step 9
        imagePicker.dismiss(animated: true, completion: nil)// step 10 
    }

    @IBAction func AddTapped(_ sender: Any) {
        // step 44 below
        if memory != nil{
            memory!.title = TextField.text // step 45
            memory?.image = UIImagePNGRepresentation(imageView.image!) as NSData! //step 46
        }
        else{
            // step 47
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let memory  = Memory(context: context) //step 48
            memory.title = TextField.text //step 49
            memory.image = UIImagePNGRepresentation(imageView.image!) as NSData! //50
            
        }
        /*let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //step 12
        let memory = Memory(context: context) // step13
        memory.title = TextField.text //step14
        memory.image = UIImagePNGRepresentation(imageView.image!) as NSData! //step 15
        (UIApplication.shared.delegate as! AppDelegate).saveContext() // step16
        navigationController!.popViewController(animated: true)
        // step 28 done in order to pop view controlled on tap of add
        */
        (UIApplication.shared.delegate as! AppDelegate).saveContext() // step 45
        navigationController!.popViewController(animated: true) // step 46
        
        
    }
    // step 51 below is for delete option
    
    @IBAction func DeleteTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //step 52
        context.delete(memory!) // step 53
        (UIApplication.shared.delegate as! AppDelegate).saveContext() // step 54
        navigationController!.popViewController(animated: true) // step 55
        
    }
}
// step 6 involves opening info.plist
// step 11 involves making a class in the core data, for images we always use external storage and also uncheck optionals for each property
// also select
//step 16 seems;wrong after this we move onto


