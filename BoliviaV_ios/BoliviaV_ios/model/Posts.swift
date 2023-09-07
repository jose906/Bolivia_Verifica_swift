//
//  Posts.swift
//  BoliviaV_ios
//
//  Created by Jose Estenssoro on 31/10/22.
//

import Foundation

struct Posts:Codable{
    
    let Post:[Posts]
    
}

struct Post:Codable{

    let id:Int
    let date:String
    let date_gmt:String
    let guid:Guid
    let modified:String
    let modified_gmt:String
    let slug:String
    let status:String
    let type:String
    let link:String
    let title:Title
    let content:Content
    let author:Int
    let featured_media:Int
    let comment_status:String
    let ping_status:String
    let sticky:Bool
    let template:String
    let format:String
    let categories:[Int]
    
}

struct Guid:Codable{
    
    let rendered:String
    
    
}
struct Title:Codable{

    let rendered:String
    

}

struct Content:Codable{
    
    let rendered:String
    let protected:Bool
    
}

struct Media:Codable{
    
    let  id:Int
    let  date:String
    let  date_gmt:String
    let  guid:Guid
    let  modified:String
    let  modified_gmt:String
    let  slug:String
    let  status:String
    let  type:String
    let  link:String
    let  title:Title
    let  author:Int
    let  comment_status:String
    let  ping_status:String
    let  media_type:String
    let  mime_type:String
    let  media_details:Media_Details
    let  post:Int
    let  source_url:String
    
}
struct Media_Details:Codable{
    
    let width:Int
    let height:Int
    let file:String
    let filesize:Int
    let sizes:Sizes
    
    
}

struct Sizes:Codable{
    
    let  medium:Medium
    let  thumbnail:Thumbnail
   
    let  full:Full
    
    
}

struct Medium:Codable{
    
    let file:String
    let width:Int
    let height:Int
    let filesize:Int
    let mime_type:String
    let source_url:String
    
}
struct Thumbnail:Codable{
    let file:String
    let width:Int
    let height:Int
    let filesize:Int
    let mime_type:String
    let source_url:String
    
}
struct Medium_Large:Codable{
    
    let file:String
    let width:Int
    let height:Int
    let filesize:Int
    let mime_type:String
    let source_url:String
    
    
}
struct Covernews_Featured:Codable{
    
    let file:String
    let width:Int
    let height:Int
    let filesize:Int
    let mime_type:String
    let source_url:String
}
struct Full:Codable{
    
    let file:String
    let width:Int
    let height:Int
    let mime_type:String
    let source_url:String
    
}
