import Foundation
import UIKit

struct Pizza: ItemCompravel {
    let name: String
    let ingredients: String
    let price: Double
    let link: URL
    
    init(nome: String, ingredientes: String, preco: Double, imageLink: URL) {
        name = nome
        ingredients = ingredientes
        price = preco
        link = imageLink
    }
}
