import Foundation
import WebKit

class ViewControllerLocalizacao: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var tituloLocalizacao: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.google.com/maps")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        tituloLocalizacao.blackBorder()
    }
}
