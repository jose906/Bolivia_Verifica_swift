//
//  RegisterController.swift
//  BoliviaV_ios
//
//  Created by Jose Estenssoro on 11/11/22.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth


class RegisterController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnred: UIButton!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var ciudad: UITextField!
    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var contra: UITextField!
    var uid:String=""
    var reference:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        reference=Database.database().reference()
        
        btnred.layer.borderWidth = 1.0
        btnred.layer.masksToBounds = false
        btnred.backgroundColor = UIColor.red
        btnred.layer.cornerRadius = btnred.frame.size.width / 10
        btnred.clipsToBounds = true
        btnred.tintColor = UIColor(cgColor: CGColor(red: 213/255, green: 1/255, blue: 2/255, alpha: 0))
        img.image = img.image?.withRenderingMode(.alwaysTemplate)
        img.tintColor = UIColor(red: 220/255, green: 220/255, blue: 10/255, alpha: 0.5)
        contra.isSecureTextEntry = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registro(_ sender: Any) {
        
        if correo.text?.isEmpty ?? true || contra.text?.isEmpty ?? true{
            
            
            let dialogMessage = UIAlertController(title: "Error", message: "Tienes que llenar todos los campos", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                
                    
                
             })
            // Present alert to user
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            
        }else{
            let name1:String = nombre.text!
            let ciudad1:String = ciudad.text!
            let correo1:String = correo.text!
            let contra1:String = contra.text!
            Auth.auth().createUser(withEmail: correo1, password: contra1){(authresult , error) in
                
                guard let user = authresult?.user else{
                    
                    let dialogMessage1 = UIAlertController(title: "Error", message: "Hubo algun error", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                        
                            
                        

                        
                        
                     })
                    // Present alert to user
                    dialogMessage1.addAction(ok)
                    self.present(dialogMessage1, animated: true, completion: nil)
                    
                    return
                    
                    
                }
                
                self.uid = user.uid
                
                self.reference.child("data").child(self.uid).child("datos").setValue(["nombre":name1,"ciudad":ciudad1,"correo":correo1])
                let dialogMessage = UIAlertController(title: "Cuenta Creada", message: "Su cuenta fue creada correctamente!", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let initialViewController = storyboard.instantiateInitialViewController()
                        UIApplication.shared.windows.first?.rootViewController = initialViewController
                    

                    
                    
                 })
                // Present alert to user
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
                
            
        }
        
        
            
            
        }
        
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
  

}
