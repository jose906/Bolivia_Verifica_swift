//
//  Categories.swift
//  BoliviaV_ios
//
//  Created by Jose Estenssoro on 10/11/22.
//

import Foundation


struct Categorie:Codable{
    
    let id:Int
    let count:Int
    let description:String
    let link:String
    let name:String
    let slug:String
    let taxonomy:String
    let parent:Int

    
}
