//
//  NewPostViewController.swift
//  FirebaseApp
//
//  Created by Robert Canton on 2018-02-09.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import Foundation
import UIKit
import Firebase

protocol NewPostVCDelegate {
    func didUploadPost(withID id:String)
}

class NewPostViewController:UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var StudentName: UITextField!
    @IBOutlet weak var StudentID: UITextField!
    @IBOutlet weak var Academy: UITextField!
    @IBOutlet weak var IDCard: UITextField!
    @IBOutlet weak var BirthPlace: UITextField!
    @IBOutlet weak var Telephone: UITextField!
    @IBOutlet weak var Email: UITextField!
    
    var delegate:NewPostVCDelegate?
    
    @IBAction func handlePostButton() {
        
        // Firebase code here
        let studentName = StudentName.text!
        let postRef = Database.database().reference().child("students/\(studentName)")
        
        let postObject = [
            "studentName": StudentName.text!,
            "studentID": StudentID.text!,
            "academy": Academy.text!,
            "IDCard": IDCard.text!,
            "birthplace": BirthPlace.text!,
            "telephone": Telephone.text!,
            "email": Email.text!,
            "grades":[String : Any]()
            ] as [String:Any]
        
        postRef.setValue(postObject, withCompletionBlock: { error, ref in
            if error == nil {
                self.delegate?.didUploadPost(withID: ref.key!)
                self.dismiss(animated: true, completion: nil)
            } else {
                // Handle the error
            }
        })
    }
    
    @IBAction func handleCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        // textView.resignFirstResponder()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
            super.dismiss(animated: flag, completion: completion)
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelButton.tintColor = secondaryColor
        
        doneButton.backgroundColor = secondaryColor
        doneButton.layer.cornerRadius = doneButton.bounds.height / 2
        doneButton.clipsToBounds = true
        
        // textView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // textView.becomeFirstResponder()
        
        // Remove the nav shadow underline
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}



