//
//  CategoriesController.swift
//  BoliviaV_ios
//
//  Created by Jose Estenssoro on 9/11/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CategoriesController: UIViewController {
    
    
    
    //@IBOutlet weak var categorias: UICollectionView!
    
   
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var categorias: UICollectionView!
    @IBOutlet weak var noticias: UITableView!
    var reference:DatabaseReference!
    

    var posts = [Post]()
    var categories = [Categorie]()
    var parser = Parser()

    var uid:String=""
    var snap:DataSnapshot!
    var index:Int?
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = image.image?.withRenderingMode(.alwaysTemplate)
        
        image.tintColor = UIColor(red: 220/255, green: 220/255, blue: 10/255, alpha: 0.5)
        reference=Database.database().reference()
       
        
        if Auth.auth().currentUser != nil{
            
            uid = Auth.auth().currentUser!.uid
            print(uid)
        }
        

        
        //noticias.register(UITableViewCell.self, forCellReuseIdentifier: "not")
        noticias.dataSource = self
        noticias.delegate = self
       
       
        
        //categorias.register(UICollectionViewCell.self, forCellWithReuseIdentifier:"cat")
        categorias.dataSource = self
        categorias.delegate = self
        
        
        //UIImageView(image: UIImage(named: "fondo.png"))
        //cell.tintColor = UIColor(red: 220/255, green: 220/255, blue: 10/255, alpha: 0.5)
        
        //noticias.backgroundView =

        
        
        parser.getposts{data in
        
            self.posts = data
            
            //print(data.count)
            
            DispatchQueue.main.async {
                self.noticias.reloadData()
            }

            
        }
        
        parser.getcategories{ data2 in
            self.categories = data2
           // print("holas2")
            print(data2.count)
            DispatchQueue.main.async {
                
               self.categorias.reloadData()
            }
            
            
            
        }

        // Do any additional setup after loading the view.
    }
    

    
    
    

}
extension CategoriesController:UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "not", for: indexPath)
        cell.layer.anchorPointZ = CGFloat(indexPath.row);
       // cell.backgroundView = UIImageView(image: UIImage(named: "fondo.png"))
        
        if let send = cell.viewWithTag(14) as? UIButton{
            send.tintColor = UIColor.red.withAlphaComponent(0)
            
        }
           //print(posts[indexPath.row].title.rendered)
        if let button = cell.viewWithTag(14) as? UIButton{
            
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
                
            }else{
                button.addTarget(self, action: #selector(self.NoLogin), for: .touchUpInside)
                
            }
            
        }
        
    
    
        if let label = cell.viewWithTag(10) as? UILabel {
            
            label.text = posts[indexPath.row].title.rendered
            
        }
        if let label = cell.viewWithTag(11) as? UILabel {
            
            
            label.text = DateConverter.convert(posts[indexPath.row].date)
            
            
        }
        if let label = cell.viewWithTag(12) as? UILabel {
            
            let originalString = String(posts[indexPath.row].author)
            
            if let decodedString = originalString.removingPercentEncoding {
                let fixedString = decodedString.replacingOccurrences(of: "&#8220;", with: "\"").replacingOccurrences(of: "&#8221;", with: "\"")
                label.text = fixedString
            } else {
                // Handle decoding error
            }
           // label.text = String(posts[indexPath.row].author)
            //let responseString = String(data: data,encoding: .utf8)
            
            
        }
       
        if let share = cell.viewWithTag(15) as? UIButton {
            
            share.tag = indexPath.row
            share.addTarget(self, action: #selector(self.share), for: .touchUpInside)
            
            
        }
        
        
        if let image = cell.viewWithTag(13) as? UIImageView{
            
            let id  = posts[indexPath.row].featured_media
           // print(id)
            
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
                    print(result.media_details.sizes.medium.source_url)
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
        
        
       
        return cell
        
    }
    @objc func share(sender:UIButton!){
        let btn:UIButton = sender
        let tag = btn.tag
        posts[tag].link
        let activityViewController =  UIActivityViewController(activityItems: [posts[tag].title, posts[tag].link], applicationActivities: nil)
                present(activityViewController, animated: true)
        
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
                        if let imagebtn = UIImage(systemName: "bookmark"){
                            print("hola")
                            btn.setImage(imagebtn, for: .normal)
                           
                        
                        }
                        
                        
                    }else{
                       
                        if a == snapshot.childrenCount
                        {
                            self.reference.child("data").child(self.uid).child("save").childByAutoId().setValue(tag)
                            if let imagebtn = UIImage(systemName: "bookmark.fill"){
                                print("hola")
                                btn.setImage(imagebtn, for: .normal)
                               
                            
                            }
                            
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
        var dialogMessage = UIAlertController(title: "Error", message: "Tienes que registrarte para esta funcion.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })
        // Present alert to user
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "CatNews", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewsController {
            destination.post = posts[index!]
            
        }
    }
  
    
}
extension CategoriesController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cat", for: indexPath)
        //cell.layer.backgroundColor = UIColor.clear.cgColor
        
    
        //print(categories[indexPath.row ].name)
        //cell.backgroundColor = UIColor.red
        
    
        if let image = cell.viewWithTag(3) as? UIImageView{
            
            switch categories[indexPath.row].name{
            case "Virales":
                image.image = UIImage(named: "todo")
            case "Coronavirus":
                image.image = UIImage(named: "coronavirus")
                image.layer.borderColor = CGColor(red: 51/255, green: 34/255, blue: 2/255, alpha: 1)
            case "SinDuda":
                image.image = UIImage(named: "sinduda")
                image.layer.borderColor = CGColor(red: 148/255, green: 66/255, blue: 146/255, alpha: 1)
              
            case "Periodismo de Soluciones":
                image.image = UIImage(named: "soluciones")
                image.layer.borderColor = CGColor(red: 0, green: 45/255, blue: 78/255, alpha: 1)
            case "Discurso":
                image.image = UIImage(named: "discurso")
                image.layer.borderColor = CGColor(red: 86/255, green: 153/255, blue: 172/255, alpha: 1)
            case "Elecciones":
                image.image = UIImage(named: "elecciones")
                image.layer.borderColor = CGColor(red: 107/255, green: 110/255, blue: 158/255, alpha: 1)
            case "Engañoso":
                image.image = UIImage(named: "enga")
              image.layer.borderColor = CGColor(red: 249/255, green: 178/255, blue: 51/255, alpha: 1)
            case "Entrevistas":
                image.image = UIImage(named: "entre")
              image.layer.borderColor = CGColor(red: 17/255, green: 91/255, blue: 101/255, alpha: 1)
            case "Explicador":
                image.image = UIImage(named: "explicador")
              image.layer.borderColor = CGColor(red: 37/255, green: 90/255, blue: 157/255, alpha: 1)
            case "Falso":
                image.image = UIImage(named: "falso")
              image.layer.borderColor = CGColor(red: 229/255, green: 21/255, blue: 33/255, alpha: 1)
            case "Verdadero":
                image.image = UIImage(named: "verdadero")
              image.layer.borderColor = UIColor(red: 6/255, green: 124/255, blue: 53/255, alpha: 1).cgColor
                
            case "Verificación discurso de odio":
                image.image = UIImage(named: "odio")
              image.layer.borderColor = UIColor(red: 6/255, green: 124/255, blue: 53/255, alpha: 1).cgColor
            case "Tendencias":
                image.image = UIImage(named: "tendencias")
            case "Investigación":
                image.image = UIImage(named: "investigacion")
                
            
            default:
                image.image = UIImage(named: "todo")
                
                
            }
            
    
    
            
        
            
           
            
           
        
            //image.layer.borderWidth = 2.0
            image.layer.masksToBounds = false
            //image.layer.borderColor = UIColor.red.cgColor
            //image.layer.cornerRadius = image.frame.size.width / 3
            image.clipsToBounds = true
            
        }
        print(categories[indexPath.row].name + String(categories[indexPath.row].id))
        if let label = cell.viewWithTag(4) as? UILabel {
            
        
            switch categories[indexPath.row].name {
            case "Virales":
                label.text = "Todas"
            case "Periodismo de Soluciones":
                label.text = "Soluciones"
            case "Verificación discurso de odio":
                label.text = "Discurso de odio"
            default:
                label.text = categories[indexPath.row].name
            }
        
            
        
            }
    return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        posts.removeAll()
        if categories[indexPath.row].id == 3{
            parser.getposts{data in
            
                self.posts = data
                
                //print(data.count)
                
                DispatchQueue.main.async {
                    self.noticias.reloadData()
                }

                
            }
            
            
        }else
        {
            getCategorie(id: String(categories[indexPath.row].id))
            
            
        }
        
        
    }
    func getCategorie(id:String){
        
        let url = URL(string: "https://boliviaverifica.bo/wp-json/wp/v2/posts?categories="+id)
        print(id)
        
        URLSession.shared.dataTask(with: url!){
            data,response,error in
            
            if error != nil{
                
                print(error?.localizedDescription)
                
                return
            }
            
            do{
                let result:[Post] =  try JSONDecoder().decode([Post].self,from:data!)
               
                self.posts = result
                DispatchQueue.main.async {
                
                    self.noticias.reloadData()
                   
                }
                
                
                
            }catch let error{
                
               print(error)
               
                
            }
        
        }.resume()
        
        
    }
    
    
    
}
extension CategoriesController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width * 25 / 100, height: CGFloat(100.0))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
  
}


