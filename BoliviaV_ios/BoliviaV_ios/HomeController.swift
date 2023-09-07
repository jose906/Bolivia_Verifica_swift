//
//  HomeController.swift
//  BoliviaV_ios
//
//  Created by Jose Estenssoro on 9/11/22.
//

import UIKit

class HomeController: UIViewController {

    
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var titulo: UILabel!
   
    @IBOutlet weak var image2: UIImageView!
    
    
    
    var posts = [Post]()
    var parser = Parser()
    var status:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.layer.backgroundColor = UIColor.red.cgColor
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fondo.png")!)
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fondo.png")!)
        //self.view.tintColor = UIColor(cgColor: CGColor(red: 1, green: 0, blue: 0, alpha: 0))
        image2.image = image2.image?.withRenderingMode(.alwaysTemplate)
        image2.tintColor = UIColor(red: 220/255, green: 220/255, blue: 10/255, alpha: 0.5)
       
        
        
       
        
      
        
        
        parser.getAperturas { data in
            
            
            self.posts = data
            
            DispatchQueue.main.async {
                self.titulo.text = self.posts[0].title.rendered
                //print(self.posts[0].featured_media)
                self.getImageUrl(id: self.posts[0].featured_media)
            }
            
            
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    func getImageUrl(id:Int){
        
        var a = "https://boliviaverifica.bo/wp-json/wp/v2/media/" + String(id)
        
        let url = URL(string: a)
        
        URLSession.shared.dataTask(with: url!){
            data,response,error in
            
            if error != nil{
                
                print(error?.localizedDescription)
                
                return
            }
            
            do{
                let result:Media =  try JSONDecoder().decode(Media.self,from:data!)
                let url  = URL(string: result.media_details.sizes.medium.source_url)!
                
                
                if let data = try? Data(contentsOf: url) {
                    // Create Image and Update Image View
                    
                    DispatchQueue.main.async {
                        self.image.image = UIImage(data: data)
                    }
                                       
                }

                
            }catch let error{
                
                print(error.localizedDescription)
                print(error)
                print("hola")
                
                
            }
        
        }.resume()
        
    }
    
    
    @IBAction func back(_ sender: Any) {
        
        if(status==0){
            titulo.text = posts[status].title.rendered
            getImageUrl(id: posts[status].featured_media)
            status = 2
            
        }else{
            
            titulo.text = posts[status].title.rendered
            getImageUrl(id: posts[status].featured_media)
            status = status + 1
            
        }
    }
    

    @IBAction func next(_ sender: Any) {
        
        if(status==3){
            
            self.status = 0
            self.titulo.text = self.posts[self.status].title.rendered
            getImageUrl(id: self.posts[self.status].featured_media)
            self.status = self.status + 1
            
        }else{
            
            titulo.text = self.posts[self.status].title.rendered
            getImageUrl(id: self.posts[self.status].featured_media)
            status = status + 1
            
            
        }
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
