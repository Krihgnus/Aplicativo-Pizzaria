import Foundation
import UIKit

struct Bebida: ItemCompravel {
    let name: String
    let content: String
    let price: Double
    let link: URL
    
    init(nome: String, conteudo: String, preco: Double, imageLink: URL) {
        name = nome
        content = conteudo
        price = preco
        link = imageLink
    }
}
