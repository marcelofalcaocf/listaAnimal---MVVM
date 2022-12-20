//
//  SearchLicenseVC.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 15/12/22.
//

import UIKit

class SearchLicenseVC: UIViewController {

    private var alert: Alert?
    lazy var viewScreen: SearchLicenseScreen = .init()
    let viewModel = SearchLicenseViewModel()
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert = Alert(controller: self)
        viewScreen.delegate(delegate: self)
        viewScreen.configTextFieldDelegate(delegate: self)
        viewModel.delegate(delegate: self)
    }

}

extension SearchLicenseVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension SearchLicenseVC: SearchLicenseScreenProtocol {
    func actionShowButton() {
        viewModel.validaTextFields(value: viewScreen.passTextField())
        print("funcionando")
    }
    
    func actionBackButton() {
        navigationController?.popViewController(animated: false)
    }
}

extension SearchLicenseVC: SearchLicenseViewModelProtocol {
    func passViewResultValue(license: LicensePlate) {
        let vc: ResultLicenseVC = .init()
        vc.viewModel.receiveInformationForResult(license: license)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func activateAlertError(information: String) {
        alert?.getAlert(titulo: "Atenção", mensagem: information)
    }
}
