//
//  ResultImcViewController.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 11/12/22.
//

import UIKit

class ResultImcViewController: UIViewController {

    lazy var viewScreen: ResultImcScreen = .init()
    var viewModel = ResultViewModel()
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScreen.delegate(delegate: self)
        viewModel.delegate(delegate: self)
        viewModel.configView()
    }
}

extension ResultImcViewController : ResultImcScreenProtocol {
    func actionBackButton() {
        let vc: ViewController = .init()
//        navigationController?.popToRootViewController(animated: false)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func actionNewCalculation() {
        viewModel.backToPreviousView()
//        let vc: CalculateImcViewController = .init()
////        navigationController?.popViewController(animated: false)
//        navigationController?.pushViewController(vc, animated: false)
    }
}

extension ResultImcViewController: ResultViewModelProtocol {
    func backView(imc: IMC) {
        let vc: CalculateImcViewController = .init()
//        navigationController?.popViewController(animated: false)
        vc.viewModel.receiveInformation(imc: imc)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func thinnessResult() {
        viewScreen.viewThinnessResult(valueIMC: viewModel.updateView())
    }
    
    func underweightResult() {
        viewScreen.viewUnderweightResult(valueIMC: viewModel.updateView())
    }
    
    func idealResult() {
        viewScreen.viewIdealResult(valueIMC: viewModel.updateView())
    }
    
    func overweightResult() {
        viewScreen.viewOverweightResult(valueIMC: viewModel.updateView())
    }
    
    func obesityResult() {
        viewScreen.viewObesityResult(valueIMC: viewModel.updateView())
    }
}
