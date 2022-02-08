//
//  ViewController.swift
//  FormularioV4
//
//  Created by Alonso Martinez on 08/02/22.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController, UITextFieldDelegate {
    
    let db = Firestore.firestore()
    var allowedCharacters: String = ""
    var allowedCharactersSet: CharacterSet = []
    var typedCharacterSet: CharacterSet = []
    
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var apellidoPaTxtField: UITextField!
    @IBOutlet weak var apellidoMaTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var telcelTxtField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
         nameTxtField.delegate = self
         apellidoPaTxtField.delegate = self
         apellidoMaTxtField.delegate = self
         emailTxtField.delegate = self
         telcelTxtField.delegate = self
         
    }
    
    
    @IBAction func btnSave(_ sender: UIButton) {
        
        validateData()
    }
    
    func validateData(){
        if nameTxtField.text == "" || apellidoPaTxtField.text == "" || apellidoMaTxtField.text == "" || emailTxtField.text == "" || telcelTxtField.text == "" {
            
            let controller = UIAlertController(title: "Campos vacios", message: "1 o más campos están vacios, por favor llene todos los campos", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(action)
            self.show(controller, sender: nil)
            
        } else{
            db.collection("saved data").addDocument(data:["Nombre" : nameTxtField.text!,
                                                          "Apellido paterno": apellidoPaTxtField.text!,
                                                          "Apellido materno": apellidoMaTxtField.text!,
                                                          "Email" : emailTxtField.text!,
                                                          "Telefono celular" : telcelTxtField.text!])
            
            let controller = UIAlertController(title: "Guardado", message: "El registro se guardo exitosamente en la base de datos", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(action)
            self.show(controller, sender: nil)
            
            nameTxtField.text = ""
            apellidoPaTxtField.text = ""
            apellidoMaTxtField.text = ""
            emailTxtField.text = ""
            telcelTxtField.text = "0"
            
        }
    }
    
    // MARK: -- Text field delegate methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        nameTxtField.resignFirstResponder()
        apellidoPaTxtField.resignFirstResponder()
        apellidoMaTxtField.resignFirstResponder()
        emailTxtField.resignFirstResponder()
        telcelTxtField.resignFirstResponder()
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if telcelTxtField.text != "0"{
            
            allowedCharacters = "1234567890"
            allowedCharactersSet = CharacterSet(charactersIn: allowedCharacters)
            typedCharacterSet = CharacterSet(charactersIn: string)
            
        }else {
            allowedCharacters = "abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ´-_@. "
            
            allowedCharactersSet = CharacterSet(charactersIn: allowedCharacters)
            typedCharacterSet = CharacterSet(charactersIn: string)
            
        }
        
        return allowedCharactersSet.isSuperset(of: typedCharacterSet)
    }
}


