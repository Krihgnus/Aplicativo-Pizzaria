import UIKit
import Foundation

class LaunchScreenViewController: UIViewController {
    @IBOutlet weak var fundoView: UIImageView!
    
    override func viewDidLoad() {
        fundoView.sd_setImage(with: URL(string: "https://krihgnus.github.io/imagens/queijos.jpg"), completed: nil)
        fundoView.contentMode = .scaleToFill
    }
}
