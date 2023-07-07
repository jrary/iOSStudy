//
//  EntryViewController.swift
//  ToDoListApp
//
//  Created by 이다현 on 2023/07/07.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        return true
    }
    
    @IBAction func saveTask(){
        
    }
}
