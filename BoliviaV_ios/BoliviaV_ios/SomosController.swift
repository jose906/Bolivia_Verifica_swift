//
//  SomosController.swift
//  BoliviaV_ios
//
//  Created by Jose Estenssoro on 22/12/22.
//

import UIKit
import WebKit

class SomosController: UIViewController {

    @IBOutlet weak var webkit: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let a = texto()
        webkit.loadHTMLString(a, baseURL: URL( string: "https://boliviaverifica.bo/"))

        // Do any additional setup after loading the view.
    }
    
    func texto()-> String{
        
        let a = "<div class=\"entry-content\">\n" +
        "\t\t<p><span style=\"font-size: 21px;\"><strong>¿Qué es y qué hace Bolivia Verifica?</strong></span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Bolivia Verifica es un proyecto de la Fundación para el Periodismo, sin fines de lucro ni tendencia política. </span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Entre las cosas que hacemos están:</span></p>\n" +
        "<ul>\n" +
        "<li><span style=\"font-size: 18px;\">Monitoreamos la desinformación que circula en el universo de redes sociales y con ayuda de herramientas digitales y la consulta a las fuentes, desmentimos el contenido que está fuera de contexto, que es falso o que causa confusión. </span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Chequeamos afirmaciones del discurso público emitido por los políticos o cualquier persona cuya voz tenga alta repercusión mediática. Tenemos un método de análisis del discurso por el que sometemos las frases analizadas. </span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Producimos explicadores para poner en contexto y aportar datos a diversos asuntos de la agenda pública.&nbsp;</span></li>\n" +
        "<li><span style=\"font-size: 18px;\"> Capacitamos en fact-checking a periodistas y estudiantes de todo el país</span></li>\n" +
        "</ul>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">La Fundación para el Periodismo es una organización sin fines de lucro que fue creada por periodistas bolivianos el año 2008 y autorizada a funcionar como tal por la<a href=\"https://fundacionperiodismo.org/estatutos/\"> Resolución Prefectural N° 603</a> del Gobierno Autónomo Departamental de&nbsp; La Paz.&nbsp;</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Puedes encontrar nuestros estatutos y nuestra personería jurídica <a href=\"https://fundacionperiodismo.org/estatutos/\" target=\"_blank\" rel=\"noopener noreferrer\">aquí</a>.&nbsp;</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Bolivia Verifica trabaja con la metodología de <a href=\"https://chequeado.com/\">Chequeado.com</a>&nbsp; y se adhiere a los siguientes principios:</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\"><a href=\"https://www.ifcncodeofprinciples.poynter.org/\">Codigo de Principios de la Red Internacional de Fact-checking, Poynter.</a></span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\"><a href=\"https://issuu.com/asperiodistaslp/docs/eticaaplp\">Codigo de ética de periodistas (APLP)</a>&nbsp;</span></p>\n" +
        "<p style=\"text-align: justify;\"><strong><span style=\"font-size: 21px;\">Introducción</span></strong></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">La desinformación es un signo&nbsp; de época en el cual nos desenvolvemos. Si bien no hay nada nuevo debajo del sol, el ecosistema de relaciones humanas nunca antes estuvo tan vinculado a la tecnología. Por tanto, la desinformación no es nueva pero sí es novedosa la forma en la que circula.</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Si bien las redes sociales constituyen el canal natural para la difusión de desinformación, también existe la posibilidad de que los medios tradicionales las incorporen, intencionalmente o no, en sus ediciones. A pesar de que los medios y los periodistas tienen como norma desconfiar de la información que reciben, pueden ser sorprendidos y caer en las trampas de la denominada “posverdad”, generando confusión, incertidumbre y una opinión pública sustentada en datos falsos.</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">La desinformación se emite con la intención deliberada de engañar, inducir al error, manipular decisiones personales, desprestigiar o enaltecer a una institución, entidad o persona u obtener ganancias económicas o rédito político.</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">El trabajo de Bolivia Verifica se enmarca dentro de las más estrictas normas de imparcialidad y responsabilidad como fundamentos necesarios para mantener un muy alto grado de credibilidad. Es decir, no mantiene compromisos con ningún partido político ni apoya ideología partidaria alguna.</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">La metodología de trabajo es proporcionada por la organización argentina “Chequeado” que trabajó asesorando en varios países de Latinoamérica. La transferencia de la metodología y del know how se realizó a través de talleres presenciales, cursos en línea y una tutoría virtual permanente.</span></p>\n" +
        "<h2 style=\"text-align: justify;\"><span style=\"font-size: 21px;\">Directorio</span></h2>\n" +
        "<p style=\"text-align: justify;\"><strong><span style=\"font-size: 18px;\">Carla Tejerina de Cabezas</span></strong></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Presidente</span></p>\n" +
        "<p><strong><span style=\"font-size: 18px;\">Ana María Tineo</span></strong></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Vicepresidente</span></p>\n" +
        "<p><strong><span style=\"font-size: 18px;\">Isabel Mercado Heredia</span></strong></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Secretario General</span></p>\n" +
        "<p><strong><span style=\"font-size: 18px;\">Isabel Aranibar</span></strong></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Secretaria de Hacienda</span></p>\n" +
        "<p><strong><span style=\"font-size: 18px;\">Renata Hofmann</span></strong></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Vocal</span></p>\n" +
        "<h2 style=\"text-align: justify;\"><span style=\"font-size: 21px;\">Plantel Ejecutivo</span></h2>\n" +
        "<p><strong><span style=\"font-size: 18px;\">Renán Estenssoro Valdez</span></strong></p>\n" +
        "<p><span style=\"font-size: 18px;\">Director Ejecutivo</span></p>\n" +
        "<p><strong><span style=\"font-size: 18px;\">Carminia Torres Ponce</span></strong></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Administración y Finanzas</span></p>\n" +
        "<p style=\"text-align: justify;\"><strong><span style=\"font-size: 18px;\">María Isabel Gamboa </span></strong></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Auxiliar</span></p>\n" +
        "<p style=\"text-align: justify;\"><strong><span style=\"font-size: 18px;\">Yamel Villarroel </span></strong></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Asistente</span></p>\n" +
        "<p><strong><span style=\"font-size: 18px;\">Tania Frank</span></strong></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Coordinadora de la Maestría en Periodismo y la </span><span style=\"font-size: 18px;\">Formación Dual</span></p>\n" +
        "<p><strong><span style=\"font-size: 18px;\">Dayana Cárdenas </span></strong></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Coordinadora del <a href=\"https://lapazcomovamos.org/\" target=\"_blank\" rel=\"noopener noreferrer\">Observatorio La Paz Cómo Vamos </a>y la </span><span style=\"font-size: 18px;\"><a href=\"https://educamedios.org\" target=\"_blank\" rel=\"noopener noreferrer\">Alfabetización Mediática e Informacional</a> (AMI)</span></p>\n" +
        "<p><strong><span style=\"font-size: 18px;\">Sergio Ballón</span></strong></p>\n" +
        "<p><span style=\"font-size: 18px;\">Departamento de Sistemas</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 21px;\"><strong>Equipo Bolivia Verifica</strong></span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">El personal de Bolivia Verifica no tiene afiliación política alguna ni compromisos ideológicos ni religiosos. Su trabajo es estrictamente periodístico e independiente y se encuadra dentro de los parámetros éticos y principios de la Fundación para el Periodismo.</span></p>\n" +
        "<p style=\"text-align: justify;\"><strong><span style=\"font-size: 18px;\">EDITORES</span></strong></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\"><strong>Jesús Ramiro Vargas Villena</strong> <strong>(Editor en jefe)</strong></span><br>\n" +
        "<span style=\"font-size: 18px;\">Licenciado en Comunicación Social – Diplomado en Periodismo para el Desarrollo, Periodismo Latinoamericano como Agente Líder en el Desarrollo Social – Periodista</span><br>\n" +
        "<span style=\"font-size: 18px;\">Trabaja en la revista Verdad con Tinta, radio Correos del Sur y también es docente en la Universidad Católica Boliviana.</span></p>\n" +
        "<p>&nbsp;</p>\n" +
        "<p style=\"text-align: justify;\"><strong><span style=\"font-size: 18px;\">Adriana Olivera Rodríguez (Editora de política)</span></strong><br>\n" +
        "<span style=\"font-size: 18px;\">Licenciada en Comunicación Social – Periodista</span><br>\n" +
        "<span style=\"font-size: 18px;\">Trabajó en revista La Región, revista Publiagro (PAT) y Escenario Empresarial.</span></p>\n" +
        "<p style=\"text-align: justify;\"><strong><span style=\"font-size: 18px;\">PERIODISTAS</span></strong></p>\n" +
        "<p style=\"text-align: justify;\"><strong><span style=\"font-size: 18px;\">Joaquin Alvaro Martela Cruz</span></strong><br>\n" +
        "<span style=\"font-size: 18px;\">Licenciado en Comunicación Social – Periodista</span></p>\n" +
        "<p style=\"text-align: justify;\"><strong><span style=\"font-size: 18px;\">Paola Palacios</span></strong><br>\n" +
        "<span style=\"font-size: 18px;\">Licenciada en Comunicación Social – Periodista</span><br>\n" +
        "<span style=\"font-size: 18px;\">Trabajó en el Fondo de Desarrollo Forestal y en la ONG PRACTICAL ACTION – SOLUCIONES PRÁCTICAS</span></p>\n" +
        "<p style=\"text-align: justify;\"><strong><span style=\"font-size: 18px;\">Marcelo Blanco</span></strong><br>\n" +
        "<span style=\"font-size: 18px;\">Licenciado en Comunicación Social – Diplomas en Periodismo de Investigación y Redacción y Edición de Textos y Noticias – Periodista</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Trabajó como tutor en la Universidad Católica Boliviana y en la Fundación para el Periodismo</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\"><strong>REDES</strong></span></p>\n" +
        "<p><strong><span style=\"font-size: 18px;\">Romina Gariazu</span></strong></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Marketing </span><span style=\"font-size: 18px;\">&nbsp;– Coordinadora</span></p>\n" +
        "<p>&nbsp;</p>\n" +
        "<p>Correo general: info@fundacionperiodismo.org</p>\n" +
        "<p>&nbsp;</p>\n" +
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
