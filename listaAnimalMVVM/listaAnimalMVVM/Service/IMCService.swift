//
//  IMCService.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 11/12/22.
//

import Foundation

class IMCService {
    private let imc: IMC = IMC(callName: "IMC", name: nil, height: nil, weight: nil)
    
    func getIMC() -> IMC {
        return imc
    }
}
