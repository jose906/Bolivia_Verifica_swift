//
//  SearchController.swift
//  BoliviaV_ios
//
//  Created by Jose Estenssoro on 17/11/22.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class SearchController: UIViewController {
    
    @IBOutlet weak var noticias: UITableView!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var buscador: UITextField!
    var posts = [Post]()
    var uid = ""
    var reference:DatabaseReference!
    var index:Int?
    var tap: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil{
            
            uid = Auth.auth().currentUser!.uid
            print(uid)
        }
        reference=Database.database().reference()
        image.image = image.image?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor(red: 220/255, green: 220/255, blue: 10/255, alpha: 0.5)
        
        noticias.delegate = self
        noticias.dataSource = self
        tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        view.addGestureRecognizer(tap!)
        
       
        buscador.setIcon(UIImage(named: "logo")!)
        // Listen for keyboard appearances and disappearances
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    @objc func handleKeyboardShow(notification: Notification) {
        view.addGestureRecognizer(tap!)
        print("se ve")
    }
        
    @objc func handleKeyboardHide(notification: Notification) {
        view.removeGestureRecognizer(tap!)
        print("no se ve")
    }
    
    @IBAction func buscar(_ sender: Any) {
        
        print("hola")
        let busqueda = buscador.text
        seacrhPosts(search: busqueda!)
        
        
    }
    func seacrhPosts(search:String){
        
        let a = "https://boliviaverifica.bo/wp-json/wp/v2/posts?search=" + search
        
        
        let encodedUrlString = a.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: encodedUrlString!)
        
        
        URLSession.shared.dataTask(with: url!){
            data,response,error in
            
            if error != nil{
                
                print(error?.localizedDescription)
                
                return
            }
            
            do{
                let result:[Post] =  try JSONDecoder().decode([Post].self,from:data!)
               
                
                
              
                    DispatchQueue.main.async {
                        //self.image.image = UIImage(data: data)
                        self.posts  = result
                        self.noticias.reloadData()
                    }
                   
                    
                

                
                
                
                
                
            }catch let error{
                
                print(error.localizedDescription)
                print(error)
                print("hola")
                
                
            }
        
        }.resume()
        
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
extension UITextField {
func setIcon(_ image: UIImage) {
   let iconView = UIImageView(frame:
                  CGRect(x: 10, y: 5, width: 20, height: 20))
   iconView.image = image
   let iconContainerView: UIView = UIView(frame:
                  CGRect(x: 20, y: 0, width: 30, height: 30))
   iconContainerView.addSubview(iconView)
   leftView = iconContainerView
   leftViewMode = .always
}
}
extension SearchController:UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "busqueda", for: indexPath)
        
           print(posts[indexPath.row].title.rendered)
        if let label = cell.viewWithTag(20) as? UILabel {
            
            label.text = posts[indexPath.row].title.rendered
            
        }
        if let label = cell.viewWithTag(21) as? UILabel {
            
            label.text = DateConverter.convert(posts[indexPath.row].date)
            
        }
        if let label = cell.viewWithTag(22) as? UILabel {
            
            label.text = String(posts[indexPath.row].author)
            label.isHidden = true
            
        }
        if let image = cell.viewWithTag(23)as? UIImageView{
            
            let id  = posts[indexPath.row].featured_media
            print(id)
            
            let a = "https://boliviaverifica.bo/wp-json/wp/v2/media/" + String(id)
            
            let url = URL(string: a)
            
            URLSession.shared.dataTask(with: url!){
                data,response,error in
                
                if error != nil{
                    
                    print(error?.localizedDescription)
                    
                    return
                }
                
                do{
                    let result:Media =  try JSONDecoder().decode(Media.self,from:data!)
                    let urlString = result.media_details.sizes.medium.source_url
                    let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    let url  = URL(string: encodedUrlString!)!
                    
                    let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
                           if let data = data {
                               DispatchQueue.main.async {
                                   // Create Image and Update Image View
                                   image.image = UIImage(data: data)
                                   image.layer.masksToBounds = true
                                   image.layer.cornerRadius = image.bounds.width / 20
                                   
                               }
                           }
                       }

                       // Start Data Task
                       dataTask.resume()
                
                }catch let error{
                    
                    print(error.localizedDescription)
                    print(error)
                }
            
            }.resume()
            
            
            }
        if let button = cell.viewWithTag(24) as? UIButton{
            
            //button.setTitle(String(posts[indexPath.row].id), for: .normal)
            button.tintColor = UIColor.red.withAlphaComponent(0)
            if Auth.auth().currentUser != nil{
                
                reference.child("data").child(uid).child("save").observeSingleEvent(of: .value, with: {(snapshot) in
                    
                    
                    for data in snapshot.children.allObjects as! [DataSnapshot]{
                        
                        if data.value! as! Int == self.posts[indexPath.row].id{
                            
                            print(data.value)
                            
                            
                            if let imagebtn = UIImage(systemName: "bookmark.fill"){
                                print("hola")
                                button.setImage(imagebtn, for: .normal)
                                
                                
                            }
                            
                        }
                        
                        
                    }
                    
                    
                    
                })
                button.tag = self.posts[indexPath.row].id
                button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
            }
            else{
                
                button.addTarget(self, action: #selector(self.NoLogin), for: .touchUpInside)
            }
            
            
            
        }
            
        return cell
        
    }
    
    @objc func buttonAction(sender:UIButton!){
        let btn:UIButton = sender
        let tag = btn.tag
        

        reference.child("data").child(uid).child("save").observeSingleEvent(of: .value) { (snapshot)  in
            
            if snapshot.exists(){
                
                var a = 1;
                for data in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    
                    if data.value! as! Int == tag{
                        
                        self.reference.child("data").child(self.uid).child("save").child(data.key).removeValue()
                        
                    }else{
                       
                        if a == snapshot.childrenCount
                        {
                            self.reference.child("data").child(self.uid).child("save").childByAutoId().setValue(tag)
                        }
                        else{
                            a = a + 1
                            
                        }
                    }
                    
                    
                }
            }else{

                self.reference.child("data").child(self.uid).child("save").childByAutoId().setValue(tag)
                
            }
                        
        }
    
    }
    @objc func NoLogin(sender:UIButton!){
        let dialogMessage = UIAlertController(title: "Attention", message: "Necesitas iniciar sesion para usar esta funcion", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })
        // Present alert to user
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        print("hola")
        performSegue(withIdentifier: "SearchSegue", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewsController {
            destination.post = posts[index!]
            
        }
    }
  
    
    func getImageUrl(id:Int){
        
        
        
        
        
    }
}
