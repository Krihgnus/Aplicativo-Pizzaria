import Foundation
import UIKit

class CarrinhoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var descricoesTableView: UITableView!
    @IBOutlet weak var carrinhoVazio: UILabel!
    @IBOutlet weak var tracosLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var valorTotalLabel: UILabel!
    @IBOutlet weak var botaoConfirmarCompraOut: UIButton!
    @IBOutlet weak var tituloCarrinho: UILabel!
    var total: Double = 0
    
    @IBAction func botaoConfirmarCompra(_ sender: Any) {
        Carrinho.compartilhado.itens = []
        carrinhoVazio.isHidden = false
        descricoesTableView.isHidden = true
        tracosLabel.isHidden = true
        totalLabel.isHidden = true
        valorTotalLabel.isHidden = true
        botaoConfirmarCompraOut.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tituloCarrinho.blackBorder()
        botaoConfirmarCompraOut.layer.cornerRadius = 6.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        total = 0
        if Carrinho.compartilhado.itens.count >= 1 {
            carrinhoVazio.isHidden = true
            descricoesTableView.isHidden = false
            tracosLabel.isHidden = false
            totalLabel.isHidden = false
            valorTotalLabel.isHidden = false
            botaoConfirmarCompraOut.isHidden = false
            for valorAtual in Carrinho.compartilhado.itens {
                total += valorAtual.price
            }
            valorTotalLabel.text = "R$ \(total)0"
            descricoesTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Carrinho.compartilhado.itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarrinhoCell", for: indexPath) as? CarrinhoTableViewCell else {
            print("Erro")
            return UITableViewCell()
        }
        cell.descricaoLabel.text = Carrinho.compartilhado.itens[indexPath.row].name
        cell.valorDescricaoLabel.text = "R$ \(Carrinho.compartilhado.itens[indexPath.row].price)0"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        total = 0
        Carrinho.compartilhado.itens.remove(at: indexPath.row)
        descricoesTableView.deleteRows(at: [indexPath], with: .automatic)
        for valorAtual in Carrinho.compartilhado.itens {
            total += valorAtual.price
        }
        valorTotalLabel.text = "R$ \(total)0"
        if Carrinho.compartilhado.itens.count == 0 {
            carrinhoVazio.isHidden = false
            descricoesTableView.isHidden = true
            tracosLabel.isHidden = true
            totalLabel.isHidden = true
            valorTotalLabel.isHidden = true
            botaoConfirmarCompraOut.isHidden = true
        }
    }
    
}
