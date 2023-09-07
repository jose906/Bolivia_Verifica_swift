//
//  LoginController.swift
//  BoliviaV_ios
//
//  Created by Jose Estenssoro on 14/11/22.
//

import UIKit


import FirebaseAuth

class LoginController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var mail: UITextField!
    
    @IBOutlet weak var btnInicio: UIButton!
    @IBOutlet weak var contra: UITextField!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        
        btnInicio.layer.borderWidth = 1.0
        btnInicio.layer.masksToBounds = false
        btnInicio.backgroundColor = UIColor.red
        btnInicio.layer.cornerRadius = btnInicio.frame.size.width / 7
        btnInicio.clipsToBounds = true
        btnInicio.tintColor = UIColor(cgColor: CGColor(red: 213/255, green: 1/255, blue: 2/255, alpha: 0))
        contra.isSecureTextEntry = true
        image.image = image.image?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor(red: 220/255, green: 220/255, blue: 10/255, alpha: 0.5)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
       
        
      

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnlogin(_ sender: Any) {
        
        let usuario:String = mail.text!
        let pass:String = contra.text!
        
        Auth.auth().signIn(withEmail: usuario, password: pass){(users1, error) in
            
            if users1 != nil{
                let dialogMessage = UIAlertController(title: "Bienvenido", message: "sesion iniciada correctamente", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let initialViewController = storyboard.instantiateInitialViewController()
                    UIApplication.shared.windows.first?.rootViewController = initialViewController
                

                        
            
                 })
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
                
             
                
            } else{
                let dialogMessage = UIAlertController(title: "Error", message: "Su correo electronico o contraseña no son correctos", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    
                    
                   

                        
            
                 })
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
                
                
                
            }
            
        }
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
