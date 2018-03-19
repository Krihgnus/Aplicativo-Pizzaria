import Foundation
import UIKit

class ModalViewController: UIViewController {
    
    @IBOutlet weak var labelNomePizza: UILabel!
    @IBOutlet weak var imageViewPizza: UIImageView!
    @IBOutlet weak var labelIngredientes: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    var elemento: ItemCompravel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pizza = elemento as? Pizza {
            imageViewPizza.sd_setImage(with: pizza.link, completed: nil)
            labelIngredientes.text = pizza.ingredients
        }

        if let bebida = elemento as? Bebida {
            imageViewPizza.sd_setImage(with: bebida.link, completed: nil)
            labelIngredientes.text = bebida.content
        }

        labelNomePizza.text = elemento.name
        labelPreco.text = "R$ \(elemento.price)0"
        imageViewPizza.blackBorder()
    }
    
    @IBAction func buttonAdd(_ sender: Any) {
        Carrinho.compartilhado.itens.append(elemento)
        let alerta = UIAlertController(title: nil, message: "Seu item foi adicionado ao carrinho!", preferredStyle: UIAlertControllerStyle.alert)
        alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alerta, animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
}
