//
//  ResultLicenseScreen.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 18/12/22.
//

import UIKit

class ResultLicenseScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configSuperView()
        configBackGroundColor()
    }
    
    private func configSuperView() {

    }
    
    private func configBackGroundColor() {
        backgroundColor = .gray
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
