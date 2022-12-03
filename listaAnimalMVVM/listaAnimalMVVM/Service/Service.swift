//
//  Service.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 01/12/22.
//

import Foundation

class Service {
    private let animals: [Animal] = [
        Animal(name: "Spitz Alemão"),
        Animal(name: "Bulldog Francês"),
        Animal(name: "Shih Tzu"),
        Animal(name: "Rottweiler"),
        Animal(name: "Pug"),
        Animal(name: "Golden Retriever"),
        Animal(name: "Pastor Alemão"),
        Animal(name: "Yorkshire Terrier"),
        Animal(name: "Border Collier"),
        Animal(name: "Fila Brasileiro")
    ]
    
    func getAnimals() -> [Animal] {
        return animals.shuffled()
    }
}
