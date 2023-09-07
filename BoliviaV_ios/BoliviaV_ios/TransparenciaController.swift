//
//  TransparenciaController.swift
//  BoliviaV_ios
//
//  Created by Jose Estenssoro on 22/12/22.
//

import UIKit
import WebKit

class TransparenciaController: UIViewController {

    @IBOutlet weak var webkit: WKWebView!
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        let a = texto()
        webkit.loadHTMLString(a, baseURL: URL( string: "https://boliviaverifica.bo/"))

        // Do any additional setup after loading the view.
    }
    
    func texto() ->String{
        
        let a = "<div class=\"entry-content-wrap\">\n" +
        "\t\n" +
        "\t<div class=\"entry-content\">\n" +
        "\t\t<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">La Fundación para el Periodismo es una organización sin fines de lucro que fue creada por periodistas bolivianos el año 2008 y autorizada a funcionar como tal por Resolución Prefectural N° 603 del Gobierno Autónomo Departamental de&nbsp; La Paz.&nbsp;</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Puedes encontrar nuestros estatutos y nuestra personería jurídica<a href=\"https://fundacionperiodismo.org/estatutos/\" target=\"_blank\" rel=\"noopener noreferrer\"> aquí</a>.&nbsp;</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Para consultar nuestra política de fondos puedes revisar <a href=\"https://boliviaverifica.bo/politica-de-fondos/\" target=\"_blank\" rel=\"noopener noreferrer\">aquí</a>.</span></p>\n" +
        "<p>&nbsp;</p>\n" +
        "\t</div><!-- .entry-content -->\n" +
        "\t</div>"
        
        return a
        
        
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
