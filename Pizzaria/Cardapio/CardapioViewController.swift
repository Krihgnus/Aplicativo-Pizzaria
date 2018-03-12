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
        tituloCardapio.blackBorder()
        getJsonFromUrl()
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
    
    func getJsonFromUrl() {
        guard let url = URL(string: "https://rawgit.com/Krihgnus/4624dc2984e859ea34dc430cda25b39c/raw/2e3602aacb08c745a4ae98d2349346af66b02b32/cardapio.json") else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            
            if let arrayDicts = (try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)) as? [[String : Any]] {
                for dict in arrayDicts {
                    let tipo = dict["tipo"] as? String
                    
                    if let dictiValores = dict["valores"] as? [[String: Any]] {
                        for item in dictiValores {
                            var nomeItem = ""
                            var precoItem = 0.0
                            var urlImageItem: URL!
                            
                            if let nome = item["nome"] as? String {
                                nomeItem = nome
                            }
                            
                            if let preco = item["preco"] as? Double {
                                precoItem = preco
                            }
                            
                            if let strLink = item["urlImagem"] as? String {
                                urlImageItem = URL(string: strLink)
                            }
                            
                            if tipo == "pizzas" {
                                var ingredientes = ""
                                
                                if let arrIngredientes = item["ingredientes"] as? [String] {
                                    for (key, ingrediente) in arrIngredientes.enumerated() {
                                        if key == 0 {
                                            ingredientes = "\(ingrediente)"
                                        } else {
                                            ingredientes += ", \(ingrediente)"
                                        }
                                    }
                                }
                                
                                pizzas.append(Pizza(nome: nomeItem, ingredientes: ingredientes, preco: precoItem, imageLink: urlImageItem))
                            } else {
                                var conteudo = ""
                                
                                if let conteudoBebida = item["conteudo"] as? String {
                                    conteudo = conteudoBebida
                                }
                                
                                bebidas.append(Bebida(nome: nomeItem, conteudo: conteudo, preco: precoItem, imageLink: urlImageItem))
                            }
                        }
                    }
                }
            }
        }).resume()
    }
}
