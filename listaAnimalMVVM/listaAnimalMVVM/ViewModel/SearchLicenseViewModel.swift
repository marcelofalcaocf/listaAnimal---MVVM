//
//  SearchLicenseViewModel.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 17/12/22.
//

import Foundation

protocol SearchLicenseViewModelProtocol {
    func passViewResultValue(license: LicensePlate)
    func activateAlertError(information: String)
}

class SearchLicenseViewModel {
    
    private var license: LicensePlate?
    private var delegate: SearchLicenseViewModelProtocol?
    
    func receiveInformation(license: LicensePlate) {
        self.license = license
    }
    
    public func delegate(delegate: SearchLicenseViewModelProtocol?) {
        self.delegate = delegate
    }
    
    public func validaTextFields(value: String) {
        let regexPatternTwo = "^[A-Z]{3}[0-9]{1}[0-9/A-Z]{1}[0-9]{2}$"
        
        let regex = try! NSRegularExpression(pattern: regexPatternTwo)
        let isValid = regex.matches(in: value, range: NSRange(location: 0, length: value.count)).count > 0
        
        if isValid {
            license?.licensePlate = value
            guard let license = license else {return }
            delegate?.passViewResultValue(license: license)
            // TODO: ir para proxima view e passar a informacao do textfield
        } else {
            delegate?.activateAlertError(information: "Verifique se as letras estão maiúsculas, caracteres especiais e placa correta")
            // TODO: alert "verifique se as letras estao maiusculas, se nao tem caracteres especiais e se a placa está correta"
        }
    }
}
