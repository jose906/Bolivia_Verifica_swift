//
//  MyPostsController.swift
//  BoliviaV_ios
//
//  Created by Jose Estenssoro on 23/11/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class MyPostsController: UIViewController {
    
    var posts = [Post]()
    var reference:DatabaseReference!
    var uid = ""
    var index:Int?

    @IBOutlet weak var noticias: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        reference=Database.database().reference()
        if Auth.auth().currentUser != nil{
            
            uid = Auth.auth().currentUser!.uid
            print(uid)
            reference.child("data").child(uid).child("save").observeSingleEvent(of: .value, with: {(snapshot) in
                
               var a = ""
                for data in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    print(data.value!)
                    let b = data.value! as! Int
                    let c = String(b)
                    //a = a + c
                    if a.elementsEqual(""){
                        a=c
                        
                    }else{
                        
                        a = a + "," + c
                    }
                    
                
                }
                DispatchQueue.main.async {
                    self.getMyPosts(ids: a)
                }
               
                
                
            })
        }else{
            
            let dialogMessage = UIAlertController(title: "Error", message: "Tiene que iniciar sesion para continuar", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                
             })
            // Present alert to user
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            
        }
        
        noticias.delegate = self
        noticias.dataSource = self
        
        
       
      

        // Do any additional setup after loading the view.
    }
    
    func getMyPosts(ids:String){
        
        let a = "https://boliviaverifica.bo/wp-json/wp/v2/posts?orderby=include&include=" + ids
        
        let url = URL(string: a)
        
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
               // print("hola")
                
            }
        
        }.resume()
    }
    
}

extension MyPostsController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myposts", for: indexPath)
        
        
        if let label = cell.viewWithTag(40) as? UILabel {
            
            label.text = posts[indexPath.row].title.rendered
            
        }
        if let label = cell.viewWithTag(41) as? UILabel {
            
            label.text = DateConverter.convert(posts[indexPath.row].date)
            
        }
        if let label = cell.viewWithTag(42) as? UILabel {
            
            label.text = String(posts[indexPath.row].author)
            
        }
        if let image = cell.viewWithTag(43)as? UIImageView{
            
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
                                   //print("hola")
                                   image.image = UIImage(data: data)
                                   image.layer.masksToBounds = true
                                   image.layer.cornerRadius = image.bounds.width / 20
                                   
                               }
                           }
                       }
                    dataTask.resume()
                
                }catch let error{
                    
                    print(error.localizedDescription)
                    print(error)
                }
            
            }.resume()
            
            
            }
        if let button = cell.viewWithTag(44) as? UIButton{
            
            //button.setTitle(String(posts[indexPath.row].id), for: .normal)
            button.tintColor = UIColor.red.withAlphaComponent(0)
            
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
            return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "NotasSegue", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewsController {
            destination.post = posts[index!]
            
        }
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
    
    
    
}

