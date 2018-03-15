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
    
    @IBAction func buttonCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonAdd(_ sender: Any) {
        Carrinho.compartilhado.itens.append(elemento)
        dismiss(animated: true, completion: nil)
    }
    
}
