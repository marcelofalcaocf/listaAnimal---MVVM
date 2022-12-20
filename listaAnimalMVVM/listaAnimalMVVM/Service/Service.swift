//
//  Service.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 01/12/22.
//

import Foundation

class Service {
    
    private let list: [Showable] = [
        Animal(callName: "Spitz Alemão"),
        Animal(callName: "Bulldog Francês"),
        Animal(callName: "Shih Tzu"),
        Animal(callName: "Rottweiler"),
        Animal(callName: "Pug"),
        Animal(callName: "Golden Retriever"),
        Animal(callName: "Pastor Alemão"),
        Animal(callName: "Yorkshire Terrier"),
        Animal(callName: "Border Collier"),
        Animal(callName: "Fila Brasileiro"),
        IMC(callName: "IMC - Calcular"),
        LicensePlate(callName: "Placa De Carro - Rodízio")
    ].shuffled()

    func getList() -> [Showable] {
        return list
    }
}
