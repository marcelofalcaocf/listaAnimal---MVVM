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

protocol AnimalviewModelProtocol {
    func passView()
    func activateAlert(name: String)
}

class AnimalViewModel {
    
    private let service: Service = .init()
    private let imcService: IMCService = .init()
//    private var alert: Alert?
    private var list: [Showable] = []
    private var chosenItem: Showable?
    private var delegate: AnimalviewModelProtocol?
    
    private func getListAll() {
        list.append(imcService.getIMC())
        list.append(contentsOf: service.getAnimals())
        list.shuffle()
    }
    
    public func delegate(delegate: AnimalviewModelProtocol?) {
        self.delegate = delegate
    }
    
    public func getList() {
        getListAll()
    }
    
    public func getNumberOfList() -> Int {
        return list.count
    }
    
    public func getCellViewModel(position: Int) -> Showable {
        let list = list[position]
        return list
    }
    
//    public func alertDelegate(viewController: UIViewController) {
//        alert = Alert(controller: viewController)
//    }
    
    public func didSelectRow(position: Int ) {
        let option = list[position]
        
        if option.callName != imcService.getIMC().callName {
            delegate?.activateAlert(name: option.callName)
//            alert?.getAlert(titulo: option.callName, mensagem: "Você, selecionou seu animal!")
            chosenItem = option
        } else {
            if let imcOption = option as? IMC {
                let vc: CalculateImcViewController = .init()
                vc.viewModel.receiveInformation(imc: imcOption)
                
            }
        }
    }
}
