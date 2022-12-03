//
//  ViewController.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 01/12/22.
//

import UIKit

class ViewController: UIViewController {

    lazy var viewScreen: ViewControllerScreen = .init()
    var viewModel = AnimalViewModel()
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScreen.delegateTableView(delegate: self, dataSource: self)
        viewModel.alertDelegate(viewController: self)
        viewModel.getList()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(position: indexPath.row)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfAnimals()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AnimalTableViewCell.identifier, for: indexPath) as? AnimalTableViewCell {
            cell.setUpCell(data: viewModel.getCellViewModel(position: indexPath.row))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
