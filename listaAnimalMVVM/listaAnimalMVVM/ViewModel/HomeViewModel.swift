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

protocol HomeviewModelProtocol {
    func passViewIMC(imc: IMC)
    func activateAlert(name: String)
    func passViewLicense(license: LicensePlate)
}

class HomeViewModel {
    
    private let service: Service = .init()
    private var delegate: HomeviewModelProtocol?
    private var listAll: [Showable] = []
    
    func getList() {
        listAll.append(contentsOf: service.getList())
    }
    
    public func delegate(delegate: HomeviewModelProtocol?) {
        self.delegate = delegate
    }
    
    public func getNumberOfList() -> Int {
        return listAll.count
    }
    
    public func getCellViewModel(position: Int) -> Showable {
        let list = listAll[position]
        return list
    }
    
    public func didSelectRow(position: Int ) {
        let option = listAll[position]
        
        if let imcOption = option as? IMC {
            delegate?.passViewIMC(imc: imcOption)
        } else if let licenseOption = option as? LicensePlate {
            delegate?.passViewLicense(license: licenseOption)
        } else {
            delegate?.activateAlert(name: option.callName)
        }
    }
}
