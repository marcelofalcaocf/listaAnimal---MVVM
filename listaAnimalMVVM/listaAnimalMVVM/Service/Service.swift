//
//  Service.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 01/12/22.
//

import Foundation

class Service {
    private let animals: [Animal] = [
        Animal(callName: "Spitz Alemão"),
        Animal(callName: "Bulldog Francês"),
        Animal(callName: "Shih Tzu"),
        Animal(callName: "Rottweiler"),
        Animal(callName: "Pug"),
        Animal(callName: "Golden Retriever"),
        Animal(callName: "Pastor Alemão"),
        Animal(callName: "Yorkshire Terrier"),
        Animal(callName: "Border Collier"),
        Animal(callName: "Fila Brasileiro")
    ]
    
    func getAnimals() -> [Animal] {
        return animals
    }
}
