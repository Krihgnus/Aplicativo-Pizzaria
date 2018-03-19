import UIKit
import Foundation

class ContatosViewController: UIViewController {
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewTelefone: UIView!
    @IBOutlet weak var viewFacebook: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewEmail.center.x -= view.bounds.width
        viewTelefone.center.x -= view.bounds.width
        viewFacebook.center.x -= view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        UIView.animate(withDuration: 1, delay: 0.4, options: [.curveEaseInOut], animations: {
            self.viewEmail.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.8, options: [.curveEaseInOut], animations: {
            self.viewTelefone.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 1.2, options: [.curveEaseInOut], animations: {
            self.viewFacebook.center.x = self.view.center.x
        }, completion: nil)
    }
}
