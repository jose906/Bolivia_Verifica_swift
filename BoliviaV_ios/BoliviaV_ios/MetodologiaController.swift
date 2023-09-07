//
//  MetodologiaController.swift
//  BoliviaV_ios
//
//  Created by Jose Estenssoro on 22/12/22.
//

import UIKit
import WebKit

class MetodologiaController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var webkit: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = texto()
        webkit.loadHTMLString(a, baseURL: URL( string: "https://boliviaverifica.bo/"))
        

        // Do any additional setup after loading the view.
    }
    
    func texto() -> String{
        
        let a = "<div class=\"entry-content\">\n" +
        "\t\t<div id=\"pl-53\" class=\"panel-layout\">\n" +
        "<div id=\"pg-53-0\" class=\"panel-grid panel-no-style\" data-ratio=\"1\" data-ratio-direction=\"right\">\n" +
        "<div id=\"pgc-53-0-0\" class=\"panel-grid-cell\" data-weight=\"1\">\n" +
        "<div id=\"panel-53-0-0-0\" class=\"so-panel widget widget_sow-editor panel-first-child panel-last-child\" data-index=\"0\" data-style=\"{&quot;background_image_attachment&quot;:false,&quot;background_display&quot;:&quot;tile&quot;}\">\n" +
        "<div class=\"so-widget-sow-editor so-widget-sow-editor-base\">\n" +
        "<div class=\"siteorigin-widget-tinymce textwidget\">\n" +
        "<p style=\"text-align: center;\"><span style=\"font-size: 32px; color: #000080;\"><strong>NUESTRO MÉTODO DE TRABAJO</strong></span></p>\n" +
        "<h2><strong>La lucha contra la desinformación en la era de la posverdad</strong></h2>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Somos un medio digital que analiza mensajes, textos, fotografías y audiovisuales que circulan en las redes sociales y/o difunden los medios de comunicación convencionales para determinar si sus contenidos tienen correspondencia con la realidad y la razón.</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Si bien la mentira difundida como noticia tiene antecedentes antiquísimos, en los últimos años – desde la aparición del Internet y la irrupción de las redes sociales – la desinformación se ha propagado sembrando incertidumbre, confusión y, en algunos casos, violencia, tanto en nuestro país como en el mundo entero. Desde <strong>“Bolivia Verifica</strong>” nos hemos propuesto combatirla y denunciarla para contribuir al fortalecimiento de la democracia y de ciudadanías bien informadas.</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Tras un largo proceso de capacitación, reflexión y aprendizaje sobre lo que constituye y las consecuencias de la desinformación y la denominada “posverdad”, iniciamos nuestro servicio a la comunidad el 1 de junio del 2019. Somos un equipo mayoritariamente integrado por periodistas jóvenes, aunque también contamos en nuestras filas con experimentados “viejos lobos de mar”.</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Recibimos capacitación de diversas organizaciones como “Chequeado.com” de Argentina, “Maldita.es” de España, “Proyecto Desconfio” de Argentina, “Politifact” de los EE.UU. y la Fundación Thomson Reuters del Reino Unido, entre otras. Actualmente trabajamos con la metodología de verificación de la desinformación y del discurso político de &nbsp;<a href=\"https://chequeado.com/\">Chequeado.com</a> <a href=\"https://chequeado.com/metodo/\">https://chequeado.com/metodo/</a> porque es el que más se ajusta a nuestra realidad.</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Diariamente nuestros periodistas/verificadores ingresan a las redes sociales y monitorean los medios tradicionales en busca de desinformación. En este tiempo, encontrar la mentira, lo engañoso y lo sesgado en las redes no es una tarea difícil. En la era de la “posverdad”, en la que la mentira se disfraza de verdad y una gran parte de la gente se deja llevar por sus emociones antes que por su razón, lo falso y lo sesgado han copado gran parte de los contenidos que circulan por las redes.</span></p>\n" +
        "<h2><strong>Nuestros principios&nbsp;</strong></h2>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Bolivia Verifica no tiene relaciones ni obligaciones de carácter religioso, político ni económico. Nuestro trabajo esta estrictamente apegado a las normas del periodismo serio, responsable e independiente. Nos debemos a la sociedad y nuestro trabajo busca llegar al ciudadano con información de calidad sobre lo que acontece en nuestro país y es tergiversado en las redes sociales o en algunos medos tradicionales.</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">No emitimos opiniones ni procesamos afirmaciones de tipo religioso, opiniones personales, del ámbito estrictamente deportivo, del espectáculo o cuestiones como denuncias de corrupción que se tramitan en el Órgano Judicial y que aún no concluyeron.</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Nuestro trabajo se enmarca en las estipulaciones señaladas en la <strong>Ley de Imprenta de 1925, la Declaración Universal de Derechos Humanos y la Constitución Política del Estado</strong>.</span></p>\n" +
        "<p><span style=\"font-size: 18px;\">En el plano ético, adherimos a los siguientes principios:</span></p>\n" +
        "<ul>\n" +
        "<li><span style=\"font-size: 18px;\">Codigo de Principios de la Red Internacional de <em>Fact-checking, Poynter.<br>\n" +
        "</em><a href=\"https://www.ifcncodeofprinciples.poynter.org/\"><em>https://www.ifcncodeofprinciples.poynter.org/</em></a></span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Codigo de Ética de la Asociación de Periodistas de La Paz.</span></li>\n" +
        "</ul>\n" +
        "<p style=\"padding-left: 40px;\"><span style=\"font-size: 18px;\"><a href=\"https://issuu.com/asperiodistaslp/docs/eticaaplp\">https://issuu.com/asperiodistaslp/docs/eticaaplp</a></span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 21px;\"><strong>&nbsp;Normas que guían nuestro trabajo</strong></span></p>\n" +
        "<p><span style=\"font-size: 18px;\">En nuestro trabajo aplicamos el<a href=\"https://ifcncodeofprinciples.poynter.org/\"> Código de Principios de la Red Internacional de Fact Checking Network del Instituto Poynter</a>. Nos apegamos a un trabajo transparente en el financiamiento y en procesos rigurosos de chequeo no partidario.</span></p>\n" +
        "<ul>\n" +
        "<li style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Queremos mejorar la calidad del debate público con información verificada y los mejores datos disponibles. </span></li>\n" +
        "<li style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Apostamos a la capacitación constante tanto de los lectores como de los periodistas. Estamos seguros que cuantos más seamos combatiendo la desinformación, daremos cada vez menos cabida a la mentira. </span></li>\n" +
        "<li style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Defendemos y promovemos el derecho de todos a contar con información fidedigna y clara, por eso, pese a no tener una Ley de acceso a la información, buscamos los mejores datos para ponerlos a disposición de los lectores.</span></li>\n" +
        "</ul>\n" +
        "<p><span style=\"font-size: 21px;\"><strong>Condiciones para la verificación</strong></span></p>\n" +
        "<p><span style=\"font-size: 18px;\">Existen algunas condiciones que un texto, mensaje o fotografía debe cumplir para que sea verificado:</span></p>\n" +
        "<ol>\n" +
        "<li><span style=\"font-size: 18px;\">Trascendencia del tema. Hay temas que son de interés de la ciudadanía y otros que, por su misma naturaleza, no son importantes ni interesantes.</span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Grado de “viralización” en el caso mensajes o notas que circulan por las redes sociales. En este caso, se analiza su comportamiento en Twitter, Facebook y en otras redes. Se toma en cuenta el número de likes que logró y cuantas veces fue compartida.</span></li>\n" +
        "<li><span style=\"font-size: 18px;\">El impacto y trascendencia que logró en los medios tradicionales. Se analiza qué medios replicaron la información y con qué intensidad.</span></li>\n" +
        "</ol>\n" +
        "<p><span style=\"font-size: 18px;\"><strong>Verificación de las fuentes</strong></span></p>\n" +
        "<p><span style=\"font-size: 18px;\">El trabajo de verificación de fuentes es fundamental. Siempre buscamos las fuentes originales e intentamos llegar hasta el origen de la desinformación. En la mayoría de los casos, las noticias falsas son difundidas a través de sitios en donde se las elabora y distribuye.</span></p>\n" +
        "<p><span style=\"font-size: 18px;\">Nuestro protocolo nos señala los siguientes pasos que seguimos en cada verificación:</span></p>\n" +
        "<ol>\n" +
        "<li><span style=\"font-size: 18px;\">Revisamos la fuente de publicación. ¿Quién la publicó? ¿Cuándo? ¿Menciona supuesta fecha, lugar de los hechos? ¿Otros medios la están replicando?</span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Contrastamos la información con datos y hechos. Si se trata de un vídeo o una imagen, se buscan las originales: ¿De cuándo es esa imagen? ¿Está manipulada?</span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Confirmamos la información publicada con el protagonista de la noticia. ¿Estuvo ahí? ¿Qué dijo en su discurso?</span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Buscamos otras fuentes: Testigos, anfitriones o asistentes a los eventos.</span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Revisamos información estadística y académica vinculada al tema y consultamos con especialistas.</span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Siempre tenemos una captura de pantalla de los bulos.</span></li>\n" +
        "</ol>\n" +
        "<p><span style=\"font-size: 18px;\"><strong>El protocolo de verificación del discurso (fact checking)</strong></span></p>\n" +
        "<p><span style=\"font-size: 18px;\">Nuestro protocolo para la verificación del discurso tiene ocho pasos que son fundamentales y que todos nuestros periodistas verificadores siguen y respetan. Estos son los siguientes:</span></p>\n" +
        "<ol>\n" +
        "<li><span style=\"font-size: 18px;\">Seleccionar una frase del ámbito público y/o una publicación viral que circula en redes sociales.</span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Ponderar su relevancia.</span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Consultar a la fuente original.</span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Consultar a la fuente oficial.</span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Consultar a fuentes alternativas.</span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Ubicar en contexto.</span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Confirmar, relativizar o desmentir la afirmación.</span></li>\n" +
        "<li><span style=\"font-size: 18px;\">Calificar y clasificar la nota dentro de las categorías que trabajamos.</span></li>\n" +
        "</ol>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Además tomamos en cuenta lo siguiente:</span></p>\n" +
        "<ul>\n" +
        "<li style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Las publicaciones o declaraciones objeto de verificación deben haber sido expresadas en documentos, medios de comunicación o ámbitos públicos.</span></li>\n" +
        "<li style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Deben ser relevantes para la agenda pública por el protagonismo de quién las emitió, por el tema aludido o por su repercusión.</span></li>\n" +
        "<li style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Por su particular repercusión en la agenda pública, las declaraciones de las más altas autoridades del Estado y del gobierno, quienquiera que sean, merecen una atención especial de nuestro equipo.</span></li>\n" +
        "<li style=\"text-align: justify;\"><span style=\"font-size: 18px;\"><strong>Bolivia Verifica</strong> no emplea fuentes anónimas. Las fuentes utilizadas son citadas y, siempre que sea posible, se incluye el enlace al documento y a los datos originales para que éstos sean accesibles.</span></li>\n" +
        "<li style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Nuestro objetivo es que cualquier persona que quiera reproducir un chequeo y encontrar los datos originales utilizados en una nota, pueda hacerlo y llegar a la misma conclusión que <strong>Bolivia Verifica</strong>.</span></li>\n" +
        "</ul>\n" +
        "<p><span style=\"font-size: 18px;\">&nbsp;<strong>Categorías para la clasificación de las verificaciones</strong></span></p>\n" +
        "<p><span style=\"font-size: 18px;\"><strong>&nbsp;</strong>Trabajamos con las siguientes cuatro categorías para clasificar el resultado de una verificación:</span></p>\n" +
        "<ol>\n" +
        "<li><span style=\"font-size: 18px;\"><strong>Verdadero.</strong> La afirmación demostró ser verdadera al ser contrastada con las fuentes y datos más serios y confiables.</span></li>\n" +
        "<li><span style=\"font-size: 18px;\"><strong>Falso</strong>. Las afirmaciones carecen de sustento y no tienen coherencia con los hechos reales o los documentos de respaldo.</span></li>\n" +
        "<li><span style=\"font-size: 18px;\"><strong>Engañoso.</strong> La afirmación puede coincidir parcialmente con ciertos datos, pero -intencionalmente o no- fue manipulada para generar un mensaje en particular. Es decir, se mezclan datos verdaderos con falsedades para engañar al lector o audiencia.</span></li>\n" +
        "<li><span style=\"font-size: 18px;\"><strong>No verificable</strong>. Son productos que no cuentan con respaldos estadísticos o documentales necesarios con los que se puedan contrastar datos. No son verificables los memes debido a que no circulan en las redes con formatos de productos informativos y son fácilmente identificables.No son objeto de verificación opiniones, comentarios o enunciados de compromisos o proyecciones de largo plazo.</span></li>\n" +
        "</ol>\n" +
        "<p>&nbsp;</p>\n" +
        "<p><strong><span style=\"font-size: 21px;\">Mecanismos de rectificación, corrección y actualización</span></strong></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Bolivia Verifica busca el máximo de rigurosidad, exactitud y precisión en la información que difunde. Sin embargo, en caso de equivocarnos, nos comprometemos a rectificar, actualizar o corregir.</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">En caso de que una persona o institución nos alerten sobre un posible error en una nota, el equipo se tomará un máximo de 48 horas para realizar una revisión del contenido cuestionado y, en caso de que corresponda, publicaremos la corrección, actualización o rectificación.</span></p>\n" +
        "<p><span style=\"font-size: 18px;\">Entendemos estos términos como la aclaración&nbsp; jerárquica de la enmienda. “Rectificación” es la palabra usada para cambiar la categoría inicialmente asignada,&nbsp; “Corrección” se refiere a una conclusión errada que merece ser revisada pero que no necesariamente significa el cambio de categoría y finalmente “actualización”&nbsp; es la complementación de la información dada cuando surgen nuevos datos a considerar.&nbsp;</span></p>\n" +
        "<p><span style=\"font-size: 18px;\">En el caso de hacer algún cambio de los antes señalados, la nota llevará una explicación que precise la modificación realizada.</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Agradecemos los comentarios o notificaciones sobre alguna posible omisión o error relevante, por ello nuestros editores están atentos a las sugerencias que se envíen a sus <a href=\"carolinamendez@boliviaverifica.bo\">correos</a> , mensajes de<a href=\"https://api.whatsapp.com/send?phone=59162535868&amp;text=Correci%C3%B3n\"> whatsapp</a> o nuestra fanpage de<a href=\"https://www.facebook.com/BoliviaVerifica/\"> Facebook</a>. </span><span style=\"font-size: 18px;\">Nuestro material de boletines, podcasts y videos también se somete a nuestra metodología y a la rectificación.</span></p>\n" +
        "<p><span style=\"font-size: 18px;\">Es necesario también aclarar que si se evidencia la violación a alguno de los principios de la <a href=\"https://www.poynter.org/ifcn/\">IFCN</a>, puede contactarse&nbsp; directamente con ellos para notificarlo (<a href=\"https://www.facebook.com/factchecknet/\">Facebook</a> y <a href=\"https://twitter.com/factchecknet\">Twitter</a>).</span></p>\n" +
        "<p><span style=\"font-size: 18px;\"><b>¿Qué errores pueden ser rectificados o corregidos?</b></span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\"><b>Una cifra: </b><span style=\"font-weight: 400;\">Bolivia Verifica siempre apela a los datos oficiales o bien a la convención internacional para emitir sus criterios.&nbsp;</span></span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\"><b>Un lugar: </b><span style=\"font-weight: 400;\">Cuando existan diferencias entre el origen geográfico de la información y los datos de la misma.</span></span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\"><b>Una categoría:</b><span style=\"font-weight: 400;\"> Cuando se constate que la categoría atribuida no corresponde con el fondo de la verificación.</span></span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\"><b>Toda afirmación realizada por Bolivia Verifica es susceptible de revisión </b>y en caso de constatarse un error, de emitirse una aclaración y/o rectificación. Las solicitudes de rectificación no pueden ir en contra a los principios a los que nos sometemos ni tampoco deben guiar o censurar la información.</span></p>\n" +
        "<p><span style=\"font-size: 18px;\"><b>Procedimiento para la modificación de un contenido:</b></span></p>\n" +
        "<p><span style=\"font-size: 18px;\"><span style=\"font-weight: 400;\">La nota con algún error será editada en el sistema y se le colocará en el titular la palabra </span><b>“actualización”, “corrección” o “rectificación”.</b><span style=\"font-weight: 400;\">&nbsp;</span></span></p>\n" +
        "<p><span style=\"font-weight: 400; font-size: 18px;\">En un primer párrafo con negrillas y cursiva se pondrá la fecha y a continuación una explicación sobre qué se está rectificando. A continuación, una nota pequeña de uno o dos párrafos con la explicación. Con una línea de separación, la nota con el error se mantendrá.&nbsp;</span></p>\n" +
        "<p><span style=\"font-weight: 400; font-size: 18px;\">Se volverá a hacer la difusión en redes sociales y en la nota, adjuntando el primer párrafo de la explicación.&nbsp;</span></p>\n" +
        "<p><span style=\"font-size: 18px;\"><span style=\"font-weight: 400;\">Puede revisar por ejemplo </span><a href=\"https://boliviaverifica.bo/andres-rojas-se-encuentra-cumpliendo-aislamiento-domiciliario-desde-la-tarde-del-8-de-junio/\"><span style=\"font-weight: 400;\">aquí</span></a></span></p>\n" +
        "<p><span style=\"font-size: 18px;\">Aquí la lista de actualizaciones, rectificaciones y correcciones:</span></p>\n" +
        "<h3 style=\"text-align: justify;\"><span style=\"font-size: 18px;\"><strong>NOTAS ACTUALIZADAS (+)</strong></span></h3>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">1) &nbsp; &nbsp; <a href=\"https://boliviaverifica.bo/unitel-indico-que-el-petardazo-era-contra-la-personeria-del-mas/\">&nbsp;Unitel indicó en su pie de pantalla que el petardazo era contra la personería del MAS</a></span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">ACTUALIZACIÓN 11/05/20: Tras la publicación de esta verificación, el jefe de Prensa de Unitel, Ruy D’alencar, jefe nacional de información de la Red Unitel, precisó a Bolivia Verifica que “desde la redacción se pudo comprobar que habían dos convocatorias distintas una de ellas era la oposición al gobierno de Jeanine Áñez y las elecciones, que es la primera parte del voice over y la otra convocatoria era en contra del MAS pidiendo que se revienten cohetes pidiendo la anulación de la personería jurídica del MAS”.</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">2)&nbsp; &nbsp; &nbsp; Primera nota publicada el 04/02/20 &gt;&gt;<a href=\"https://boliviaverifica.bo/imagenes-registradas-en-peru-circulan-como-si-fuesen-bolivia/\"> Imágenes registradas en Perú circulan como si fuesen Bolivia</a></span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Nota Actualizada el 05/02/20 &gt;&gt;<a href=\"https://boliviaverifica.bo/pagina-de-facebook-de-peru-difunde-hechos-ocurridos-en-bolivia-como-si-fueran-de-su-pais/?fbclid=IwAR3RRzFBdEwzS_ok5Quc7JkrZQZhZE_ZVG0UrlgFZ9PJ9SetBZ1wg1Axpb0\"> Una página de Facebook de Perú difunde hechos ocurridos en Bolivia como si fueran de su país</a></span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Después de un seguimiento minucioso a la fotografía, se actualizó esta nota porque en el Perú se estaba utilizando esta fotografía de un hecho sucedido en la ciudad de Santa Cruz. Esto fue gracias a la alerta de nuestros seguidores. Así que, aparte de actualizar la nota, también se cambió la categoría: de falso a engañoso.</span></p>\n" +
        "<h3>NOTAS CORREGIDAS (+)</h3>\n" +
        "<blockquote class=\"wp-embedded-content\" data-secret=\"9HPfAaMGE1\" style=\"display: none;\"><p><a href=\"https://boliviaverifica.bo/es-falsa-la-carta-de-terceros-agradeciendo-al-gobierno-argentino-por-material-antimotin/\">Corrección: No es posible saber hasta el momento si la carta de Terceros agradeciendo al gobierno argentino es falsa o no</a></p></blockquote>\n" +
        "<p><iframe class=\"wp-embedded-content\" sandbox=\"allow-scripts\" security=\"restricted\" title=\"“Corrección: No es posible saber hasta el momento si la carta de Terceros agradeciendo al gobierno argentino es falsa o no” — Bolivia Verifica\" src=\"https://boliviaverifica.bo/es-falsa-la-carta-de-terceros-agradeciendo-al-gobierno-argentino-por-material-antimotin/embed/#?secret=9HPfAaMGE1\" data-secret=\"9HPfAaMGE1\" width=100% height=\"574\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\"></iframe></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\"><strong>Corrección (10:00 del 10 de julio de 2021).</strong>&nbsp;La noche del viernes 9 de julio, dos nuevos elementos surgieron sobre la supuesta carta de agradecimiento que el excomandante de la FAB, Gral. Jorge Terceros habría enviado al embajador argentino, Normando Álvarez, en noviembre del 2019. El primero de ello es la&nbsp;<strong>certificación que hace el Ministro de Defensa, Edmundo Novillo,</strong>&nbsp;que señala que en los archivos de la Fuerza Aérea&nbsp;<strong>se encuentra la copia de la supuesta nota</strong>, hecho que&nbsp;<strong>certifica y legaliza</strong>, lo que la constituye en un documento legal. Y el segundo&nbsp;<strong>es el sello de recepción de la nota</strong>&nbsp;(15 de noviembre de 2019) que&nbsp;<strong>la Embajada Argentina asegura</strong>&nbsp;cursa en sus registros.</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">La nota en un inicio comprobó que la&nbsp;<strong>renuncia</strong>&nbsp;de Terceros se realizó el&nbsp;<strong>12 de noviembre de 2019</strong>, esto&nbsp;<strong>pone en duda</strong>&nbsp;que la carta haya sido<strong>&nbsp;firmada por él el día 13</strong>, sin embargo, no lo comprueba.</span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Por tanto, ante estos nuevos elementos,&nbsp;<strong>los varios comentarios de nuestros lectores</strong>&nbsp;y la falta de una&nbsp;<strong>pericia grafológica</strong>&nbsp;obligan a&nbsp;<strong>retirar</strong>&nbsp;la categoría de&nbsp;<strong>“falso”</strong>&nbsp;que Bolivia Verifica consignó el viernes, hasta que surjan&nbsp;<strong>nuevos elementos</strong>&nbsp;que permitan emitir un criterio en torno a su&nbsp;<strong>autenticidad</strong>.</span></p>\n" +
        "<h3 style=\"text-align: justify;\"><span style=\"font-size: 18px;\"><strong>NOTAS RECTIFICADAS (+)</strong></span></h3>\n" +
        "<p class=\"entry-title\" style=\"text-align: justify;\"><span style=\"font-size: 18px;\"><a href=\"https://boliviaverifica.bo/cientifico-boliviano-busca-patente-de-la-quinina-pero-el-uso-de-cloroquina-e-hidroxicloroquina-en-covid-19-no-tiene-respaldo-de-la-oms/\">Científico boliviano busca patente de la quinina; pero el uso de Cloroquina e Hidroxicloroquina en COVID-19 no tiene respaldo de la OMS</a></span></p>\n" +
        "<p style=\"text-align: justify;\"><span style=\"font-size: 18px;\">Rectificación: El científico Javier Ruiz, en comunicación con Bolivia Verifica, indicó que el trabajo que está realizando es el de solicitar la patente de la cloroquina como producto boliviano y no así de China. En ningún momento afirma que la cloroquina cura el coronavirus.</span></p>\n" +
        "<p style=\"text-align: justify;\">\n" +
        "</p></div>\n" +
        "</div>\n" +
        "</div>\n" +
        "</div>\n" +
        "</div>\n" +
        "<div id=\"pg-53-1\" class=\"panel-grid panel-has-style\" data-style=\"{&quot;padding&quot;:&quot;45px&quot;,&quot;background&quot;:&quot;#fafafa&quot;,&quot;background_display&quot;:&quot;tile&quot;,&quot;row_stretch&quot;:&quot;full&quot;}\">\n" +
        "<div class=\"siteorigin-panels-stretch panel-row-style panel-row-style-for-53-1\" data-stretch-type=\"full\">\n" +
        "<div id=\"pgc-53-1-0\" class=\"panel-grid-cell\" data-weight=\"1\">\n" +
        "<div id=\"panel-53-1-0-1\" class=\"so-panel widget widget_sow-post-carousel panel-last-child\" data-index=\"2\" data-style=\"{&quot;background_image_attachment&quot;:false,&quot;background_display&quot;:&quot;tile&quot;}\"></div>\n" +
        "</div>\n" +
        "</div>\n" +
        "</div>\n" +
        "</div>\n" +
        "\t</div><!-- .entry-content -->\"</body>\\n\" +\n" +
        "            \"\\n\" +\n" +
        "            \"</html>\";\n"
        
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
