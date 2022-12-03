//
//  AnimalViewModel.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 01/12/22.
//

import UIKit

class AnimalViewModel {
    
    private let service: Service = .init()
    private var alert: Alert?
    private var chosenAnimal: Animal?
    private var animalsList: [Animal] = []
    
    func getList() {
        let animalList = service.getAnimals().shuffled()
        animalsList = animalList
    }
    
    func getNumberOfAnimals() -> Int {
        return animalsList.count
    }
    
    func getCellViewModel(position: Int) -> Animal {
        let animal = animalsList[position]
        return animal
    }
    
    func alertDelegate(viewController: UIViewController) {
        alert = Alert(controller: viewController)
    }
    
    func didSelectRow(position: Int ) {
        let animal = animalsList[position]
        alert?.getAlert(titulo: animal.name, mensagem: "Você, selecionou seu animal!")
        chosenAnimal = animal
    }
}
