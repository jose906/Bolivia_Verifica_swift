//
//  ApiConnect.swift
//  BoliviaV_ios
//
//  Created by Jose Estenssoro on 9/11/22.
//

import Foundation

struct Parser{
    
    func getposts(comp: @escaping ([Post])->()){
        
        let url = URL(string: "https://boliviaverifica.bo/wp-json/wp/v2/posts")
        
        URLSession.shared.dataTask(with: url!){
            data,response,error in
            
            if error != nil{
                
                print(error?.localizedDescription)
                
                return
            }
            
            do{
                let result:[Post] =  try JSONDecoder().decode([Post].self,from:data!)
               
                
                comp(result)
                
                
            }catch let error{
                
               print(error)
               
                
            }
        
        }.resume()
        
    }
    
    func getcategories(comp: @escaping ([Categorie])->()){
        
        let url = URL(string: "https://boliviaverifica.bo/wp-json/wp/v2/categories?exclude=298,620,459,8,267,3055,3230,9,3579,461&per_page=100&orderby=id")
        
        URLSession.shared.dataTask(with: url!){
            data,response,error in
            
            if error != nil{
                
                print(error?.localizedDescription)
                
                return
            }
            
            do{
                let result:[Categorie] =  try JSONDecoder().decode([Categorie].self,from:data!)
                
                comp(result)
                
                
            }catch let error{
                
                print(error.localizedDescription)
                print(error)
                
                
            }
        
        }.resume()
        
    }
    func getAperturas(comp: @escaping ([Post])->()){
        
        let url = URL(string: "https://boliviaverifica.bo/wp-json/wp/v2/posts?categories=620,298,459")
        
        URLSession.shared.dataTask(with: url!){
            data,response,error in
            
            if error != nil{
                
                print(error?.localizedDescription)
                
                return
            }
            
            do{
                let result:[Post] =  try JSONDecoder().decode([Post].self,from:data!)
                
                comp(result)
                
                
            }catch let error{
                
                print(error.localizedDescription)
                print(error)
                print("hola")
                
                
            }
        
        }.resume()
        
    }
    func getImageUrl(comp: @escaping ([Post])->()){
        
        let url = URL(string: "https://boliviaverifica.bo/wp-json/wp/v2/media/" )
        
        URLSession.shared.dataTask(with: url!){
            data,response,error in
            
            if error != nil{
                
                print(error?.localizedDescription)
                
                return
            }
            
            do{
                let result:[Post] =  try JSONDecoder().decode([Post].self,from:data!)
                
                comp(result)
                
                
            }catch let error{
                
                print(error.localizedDescription)
                print(error)
                print("hola")
                
                
            }
        
        }.resume()
        
    }
    
    
}
