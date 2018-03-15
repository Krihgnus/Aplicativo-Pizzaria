import Foundation
import UIKit
import SDWebImage

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet var tableViewFiltrados: UITableView!
    var filtrados: [ItemCompravel] = []
    
    override func viewDidLoad() {
        tableViewFiltrados.delegate = self
        tableViewFiltrados.dataSource = self
        tableViewFiltrados.rowHeight = 350
    }
    
    func searchBar (_ searchBar: UISearchBar, textDidChange searchText: String) {
//        self.tableViewFiltrados.reloadData()
//        let allItems: [ItemCompravel] = (pizzas as [ItemCompravel]) + (bebidas as [ItemCompravel])
//        filtrados = allItems.filter({ $0.name.contains(searchText) })

    }
    
    func numberOfSectionsInTableView (tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView (_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return filtrados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewFiltrados.dequeueReusableCell(withIdentifier: PizzaTableViewCell.identifier, for: indexPath) as? PizzaTableViewCell else {
            return UITableViewCell()
        }
        
        if filtrados[indexPath.row].price > 10 {
            var indice = 0
            for (key, pizza) in pizzas.enumerated() {
                if pizza.name == filtrados[indexPath.row].name {
                    indice = key
                }
            }
            cell.pizzaIngredientsLabel.text = pizzas[indice].ingredients
            cell.pizzaImage.sd_setImage(with: pizzas[indice].link, completed: nil)
            
        } else {
            var indice = 0
            for (key, bebida) in bebidas.enumerated() {
                if bebida.name == filtrados[indexPath.row].name {
                    indice = key
                }
            }
            cell.pizzaIngredientsLabel.text = bebidas[indice].content
            cell.pizzaImage.sd_setImage(with: bebidas[indice].link, completed: nil)
        }
        
        cell.pizzaNameLabel.text = filtrados[indexPath.row].name
        cell.pizzaPriceLabel.text = "R$ \(filtrados[indexPath.row].price)0"
        cell.pizzaImage.contentMode = .scaleToFill
        cell.selectionStyle = .none
        cell.pizzaImage.blackBorder()
        return cell
    }
    
}

extension SearchResultsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let allItems: [ItemCompravel] = (pizzas as [ItemCompravel]) + (bebidas as [ItemCompravel])
        filtrados = allItems.filter({ $0.name.contains(searchController.searchBar.text ?? "") })
        self.tableViewFiltrados.reloadData()
    }

}
