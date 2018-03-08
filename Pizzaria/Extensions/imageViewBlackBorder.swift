import Foundation
import UIKit

extension UIImageView {
    func blackBorder() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 5
    }
}
