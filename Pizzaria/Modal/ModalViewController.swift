import Foundation
import UIKit

class ModalViewController: UIViewController {
    
    @IBOutlet weak var labelNomePizza: UILabel!
    @IBOutlet weak var imageViewPizza: UIImageView!
    @IBOutlet weak var labelIngredientes: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    var elemento: ItemCompravel!
    
    @IBAction func buttonCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonAdd(_ sender: Any) {
        Carrinho.compartilhado.itens.append(elemento)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pizza = elemento as? Pizza {
            labelNomePizza.text = pizza.name
            imageViewPizza.sd_setImage(with: pizza.link, completed: nil)
            labelIngredientes.text = pizza.ingredients
            labelPreco.text = "R$ \(pizza.price)0"
        }
        
        if let bebida = elemento as? Bebida {
            labelNomePizza.text = bebida.name
            imageViewPizza.sd_setImage(with: bebida.link, completed: nil)
            labelIngredientes.text = bebida.content
            labelPreco.text = "R$ \(bebida.price)0"
        }
        imageViewPizza.blackBorder()
    }
    
}
