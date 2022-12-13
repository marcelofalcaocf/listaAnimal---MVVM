//
//  ResultImcViewModel.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 12/12/22.
//

import UIKit

protocol ResultViewModelProtocol {
    func thinnessResult()
    func underweightResult()
    func idealResult()
    func overweightResult()
    func obesityResult()
    func backView(imc: IMC)
}

class ResultViewModel {
    
    private var resultImc: IMC?
    private var valueImc: Double?
    private var delegate: ResultViewModelProtocol?
    
    public func delegate(delegate: ResultViewModelProtocol?) {
        self.delegate = delegate
    }
    
    public func receiveInformationForResult(imc: IMC, resultValue: Double) {
        resultImc = imc
        valueImc = resultValue
    }
    
    public func updateView() -> String {
        guard let valueImc = valueImc else {return  "0.0" }
        let doubleStr = String(format: "%.2f", valueImc)
        return doubleStr
    }
    
    public func configView() {
        guard let valueImc = valueImc else { return }
            if valueImc < 0 && valueImc < 16 {
                delegate?.thinnessResult()
            } else if valueImc < 18.5 {
                delegate?.underweightResult()
            } else if valueImc < 25 {
                delegate?.idealResult()
            } else if valueImc < 30 {
                delegate?.overweightResult()
            } else {
                delegate?.obesityResult()
            }
    }
    
    public func backToPreviousView() {
        guard let imc = resultImc else { return }
        delegate?.backView(imc: imc)
    }
}

