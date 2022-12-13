//
//  AnimalViewModel.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 01/12/22.
//

import Foundation

protocol Showable {
    var callName: String { get }
}

protocol AnimalviewModelProtocol {
    func passView(imc: IMC)
    func activateAlert(name: String)
}

class AnimalViewModel {
    
    private let service: Service = .init()
    private let imcService: IMCService = .init()
    private var list: [Showable] = []
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
    
    public func didSelectRow(position: Int ) {
        let option = list[position]
        
        if let imcOption = option as? IMC {
            delegate?.passView(imc: imcOption)
        } else {
            delegate?.activateAlert(name: option.callName)
        }
    }
}
