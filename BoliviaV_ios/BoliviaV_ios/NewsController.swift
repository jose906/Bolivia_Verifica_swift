//
//  NewsController.swift
//  BoliviaV_ios
//
//  Created by Jose Estenssoro on 1/12/22.
//

import UIKit
import WebKit

class NewsController: UIViewController {
    
    var post:Post?
    @IBOutlet weak var webkit: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var bounds: CGRect = UIScreen.main.bounds
        var width:CGFloat = bounds.size.width
        let doctype = "<!DOCTYPE html><html><head><meta charset='utf-8'><meta name='viewport'"
        let conwidth = "content='width=" + (NSString(format: "%.2f", width) as String) + ",initial-scale=1'></head><body><style>img{display: inline;height: auto;max-width: 100%;}</style>"

        let fn = "</body></html>"
        let content  =  (post?.content.rendered)! + "</body>" + "</html>";

        print(post?.title)
        //webkit.loadHTMLString(post?.content.rendered!, baseURL:nil)
        // Do any additional setup after loading the view.
        webkit.loadHTMLString(doctype + conwidth + content + fn, baseURL: nil)
        
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
