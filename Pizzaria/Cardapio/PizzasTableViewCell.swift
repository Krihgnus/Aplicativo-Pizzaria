import UIKit

class PizzaTableViewCell: UITableViewCell {

    static let identifier = "PizzaCell"
    @IBOutlet weak var pizzaNameLabel: UILabel!
    @IBOutlet weak var pizzaIngredientsLabel: UILabel!
    @IBOutlet weak var pizzaPriceLabel: UILabel!
    @IBOutlet weak var pizzaImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pizzaNameLabel.text = nil
        pizzaIngredientsLabel.text = nil
        pizzaPriceLabel.text = nil
        pizzaImage.image = nil
    }
}
