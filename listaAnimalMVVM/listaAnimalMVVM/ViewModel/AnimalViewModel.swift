//
//  AnimalViewModel.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 01/12/22.
//

import UIKit

protocol Showable {
    var callName: String { get }
}

class AnimalViewModel {
    
    private let service: Service = .init()
    private let imcService: IMCService = .init()
    private var alert: Alert?
    //    private var chosenAnimal: Animal?
    //    private var animalsList: [Animal] = []
    private var list: [Showable] = []
    private var chosenItem: Showable?
    
    private func getListAll() {
        list.append(imcService.getIMC())
        list.append(contentsOf: service.getAnimals())
        list.shuffle()
    }
    
    func getList() {
        getListAll()
    }
    
    func getNumberOfList() -> Int {
        return list.count
    }
    
    func getCellViewModel(position: Int) -> Showable {
        let list = list[position]
        return list
    }
    
    func alertDelegate(viewController: UIViewController) {
        alert = Alert(controller: viewController)
    }
    
    func didSelectRow(position: Int ) -> UIViewController?{
        let option = list[position]
        
        if option.callName != imcService.getIMC().callName {
            alert?.getAlert(titulo: option.callName, mensagem: "Você, selecionou seu animal!")
            chosenItem = option
            return nil
        } else {
            let vc: CalculateImcViewController = .init()
            vc.viewModel.receiveInformation(imc: option as! IMC)
            return vc
        }
    }
}
