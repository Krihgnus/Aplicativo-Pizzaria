import Foundation
import UIKit

class CarrinhoTableViewCell: UITableViewCell {
    
    static var identifier = "CarrinhoCell"
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var valorDescricaoLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        descricaoLabel.text = nil
        valorDescricaoLabel.text = nil
    }
}
