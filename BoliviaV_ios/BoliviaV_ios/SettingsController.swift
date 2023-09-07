//
//  SettingsController.swift
//  BoliviaV_ios
//
//  Created by Jose Estenssoro on 11/11/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class SettingsController: UIViewController {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var eliminar: UIButton!
    @IBOutlet weak var btn: UIButton!

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var mail: UILabel!
    var reference:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reference=Database.database().reference()
        if Auth.auth().currentUser != nil{
            btn.setTitle("cerrar sesion", for: .normal)
            eliminar.layer.isHidden = false
            mail.text = Auth.auth().currentUser?.email
            reference.child("data").child(Auth.auth().currentUser!.uid).child("datos").child("nombre").observeSingleEvent(of: .value, with: {(snapshot) in
                
                self.name.text = snapshot.value! as! String
                
                
            })
            
        }else{
            eliminar.layer.isHidden = true
            
        }
        reference=Database.database().reference()
        
        
        image.image = image.image?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor(red: 220/255, green: 220/255, blue: 10/255, alpha: 0.5)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteAcount(_ sender: Any) {
        
        let dialogMessage = UIAlertController(title: "Precaucion!", message: "¿Esta seguro de que deseas eliminar su cuenta?", preferredStyle: .alert)
        let si = UIAlertAction(title: "si", style: .default, handler: { (action) -> Void in
            
            
            if Auth.auth().currentUser != nil{
                
               
                do{
                    self.reference.child("data").child(Auth.auth().currentUser!.uid).removeValue()
                    let user = Auth.auth().currentUser
                    user?.delete { error in
                      if let error = error {
                        print("Error deleting user: \(error)")
                      } else {
                        print("User deleted successfully")
                          
                          let dialogMessage2 = UIAlertController(title: "Listo!", message: "Su Cuenta fue elimiada correctamente", preferredStyle: .alert)
                          let ok = UIAlertAction(title: "ok", style: .default, handler: { (action) -> Void in
                              
                              let storyboard = UIStoryboard(name: "Main", bundle: nil)
                              let initialViewController = storyboard.instantiateInitialViewController()
                              UIApplication.shared.windows.first?.rootViewController = initialViewController
                              
                              
                          })
                          dialogMessage2.addAction(ok)
                          self.present(dialogMessage2, animated: true, completion: nil)
                          
                         
                      
                      }
                    }
                    
                    try Auth.auth().signOut()
                    
                    
                }catch let signOutError as NSError{
                    
                    
                }
                
            }else{
                
                
                //performSegue(withIdentifier: "login", sender: nil)
            }
            
          

                
    
         })
        dialogMessage.addAction(si)
        let no = UIAlertAction(title: "no", style: .default, handler: { (action) -> Void in})
        dialogMessage.addAction(no)
        self.present(dialogMessage, animated: true, completion: nil)
        
        
       

        
        
    }
    

    @IBAction func action(_ sender: Any) {
        
        if Auth.auth().currentUser != nil{
            
           
            do{
                try Auth.auth().signOut()
                let dialogMessage = UIAlertController(title: "Exito", message: "Su sesion fue cerrada correctamente!", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let initialViewController = storyboard.instantiateInitialViewController()
                        UIApplication.shared.windows.first?.rootViewController = initialViewController
                    

                    
                    
                 })
                // Present alert to user
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
                    
                    
                    
                
                
            }catch let signOutError as NSError{
                
                
            }
            
        }else{
            
            
            performSegue(withIdentifier: "login", sender: nil)
        }
    }
    
    

}
