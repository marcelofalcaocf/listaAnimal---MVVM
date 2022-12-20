//
//  ResultLicenseVC.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 18/12/22.
//

import UIKit

class ResultLicenseVC: UIViewController {

    lazy var viewScreen: ResultLicenseScreen = .init()
    let viewModel = ResultLicenseViewModel()
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.presentingInformation()
        // Do any additional setup after loading the view.
    }

}
