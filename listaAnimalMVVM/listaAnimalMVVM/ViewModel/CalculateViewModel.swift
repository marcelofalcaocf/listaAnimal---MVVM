//
//  CalculateViewModel.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 11/12/22.
//

import UIKit

protocol CalculateViewModelProtocol {
    func passValue(imc: IMC, double: Double)
}

class CalculateViewModel {
    
    private var imc: IMC?
    private var valueImc: Double?
    private var delegate: CalculateViewModelProtocol?
    
    
    func delegate(delegate: CalculateViewModelProtocol?) {
        self.delegate = delegate
    }
    
    func receiveInformation(imc: IMC) {
        self.imc = imc
    }
    
    func calculationIMC(weightText: String, heightText: String) {
        if let weight = Double(weightText), let height = Double(heightText), let imc = imc {
            
            self.imc?.weight = weight
            self.imc?.height = height
            let valueImc: Double = weight / (height * height)
            self.valueImc = valueImc
            delegate?.passValue(imc: imc, double: valueImc)
        }
    }
}
