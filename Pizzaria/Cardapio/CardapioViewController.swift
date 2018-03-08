import Foundation
import UIKit
import SDWebImage

var pizzas: [Pizza] = []
var bebidas: [Bebida] = []

class ViewControllerCardapio: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewSalgadas: UITableView!
    @IBOutlet weak var tituloCardapio: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSalgadas.rowHeight = 350
        pizzas.append(Pizza(nome: "Coração", ingredientes: "(Molho, Coração, Mussarela e Orégano)", preco: 35.0, imageLink: URL(string: "https://krihgnus.github.io/imagens/coracao.jpg")!))
        pizzas.append(Pizza(nome: "Calabresa", ingredientes: "(Molho, Calabresa, Cebola, Azeitonas, Mussarela e Orégano)", preco: 30.0, imageLink: URL(string: "https://krihgnus.github.io/imagens/calabresa.jpg")!))
        pizzas.append(Pizza(nome: "Strogonoff", ingredientes: "(Molho, Lombo, Azeitonas, Mussarela e Orégano)", preco: 28.0, imageLink: URL(string: "https://krihgnus.github.io/imagens/strogonoff.jpg")!))
        pizzas.append(Pizza(nome: "Portuguesa", ingredientes: "(Molho, Cebola, Tomate, Presunto, Pimentão, Ovo, Azeitonas, Mussarela e Orégano)", preco: 39.0, imageLink: URL(string: "https://krihgnus.github.io/imagens/portuguesa.jpg")!))
        bebidas.append(Bebida(nome: "Coca Cola", conteudo: "2 Litros", preco: 7.0, imageLink: URL(string: "https://krihgnus.github.io/imagens/coca2L.jpg")!))
        bebidas.append(Bebida(nome: "Guaraná Antartica", conteudo: "2 Litros", preco: 5.5, imageLink: URL(string: "https://krihgnus.github.io/imagens/guarana.jpg")!))
        tituloCardapio.blackBorder()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
           return pizzas.count
        } else {
            return bebidas.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = UINib(nibName: "CardapioHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? CardapioHeaderView else { return nil }
        if section == 0 {
            header.titleLabel.text = "Pizzas"
        } else {
            header.titleLabel.text = "Bebidas"
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PizzaTableViewCell.identifier, for: indexPath) as? PizzaTableViewCell else {
            debugPrint("Deu ruim....")
            return UITableViewCell()
        }
        
        if indexPath.section == 0 {
            cell.pizzaNameLabel.text = pizzas[indexPath.row].name
            cell.pizzaIngredientsLabel.text = pizzas[indexPath.row].ingredients
            cell.pizzaPriceLabel.text = "R$ \(pizzas[indexPath.row].price)0"
            cell.pizzaImage.sd_setImage(with: pizzas[indexPath.row].link, completed: nil)
        } else {
            cell.pizzaNameLabel.text = bebidas[indexPath.row].name
            cell.pizzaIngredientsLabel.text = bebidas[indexPath.row].content
            cell.pizzaPriceLabel.text = "R$ \(bebidas[indexPath.row].price)0"
            cell.pizzaImage.sd_setImage(with: bebidas[indexPath.row].link, completed: nil)
        }
        cell.pizzaImage.contentMode = .scaleToFill
        cell.selectionStyle = .none
        cell.pizzaImage.blackBorder()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let modal = storyboard?.instantiateViewController(withIdentifier: "modalVC") as? ModalViewController {
            modal.modalPresentationStyle = .overCurrentContext
            modal.modalTransitionStyle = .crossDissolve
            if indexPath.section == 0 {
                modal.elemento = pizzas[indexPath.row]
            } else {
                modal.elemento = bebidas[indexPath.row]
            }
            present(modal, animated: true, completion: nil)
        }
    }
    
}
