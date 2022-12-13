//
//  CalculateImcViewController.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 11/12/22.
//

import UIKit

class CalculateImcViewController: UIViewController {

    lazy var viewScreen: CalculateImcScreen = .init()
    var viewModel = CalculateViewModel()
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScreen.delegate(delegate: self)
        viewScreen.configTextFieldDelegate(delegate: self)
        viewModel.delegate(delegate: self)
    }
}

extension CalculateImcViewController: CalculateImcScreenProtocol {
    func actionBackButton() {
        navigationController?.popViewController(animated: false)
    }
    
    func actionCalculateButton() {
        viewModel.calculationIMC(weightText: viewScreen.passWeight(), heightText: viewScreen.passHeight())
    }
}

extension CalculateImcViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewScreen.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension CalculateImcViewController: CalculateViewModelProtocol {
    func passValue(imc: IMC, double: Double) {
        let vc: ResultImcViewController = .init()
        vc.viewModel.receiveInformationForResult(imc: imc, resultValue: double)
        navigationController?.pushViewController(vc, animated: false)
    }
}
