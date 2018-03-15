import Foundation
import UIKit

class ViewControllerHistoria: UIViewController {
    @IBOutlet weak var descricaoHis: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = Bundle.main.path(forResource: "history", ofType: "txt") { //VERIFICANDO EXISTENCIA DO ARQUIVO
            do { //SE EXISTIR, FAÇA
                let conteudo = try String(contentsOfFile: path) //TENTE CONVERTER
                descricaoHis.text = conteudo
            } catch { //SE ALGUM IMPREVISTO ACONTECER NO DO, O CODIGO CAI AQUI
                print("Impossível converter os dados")
            }
        } else { //SE ARQUIVO NAO EXISTIR
            print("Arquivo não encontrado")
        }
    }
}
