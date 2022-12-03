//
//  ViewControllerScreen.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 01/12/22.
//

import UIKit

class ViewControllerScreen: UIView {

    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = .black
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Escolha o seu animal "
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 10
        tableView.register(AnimalTableViewCell.self, forCellReuseIdentifier: AnimalTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configBackGroundColor()
        configSuperView()
        configConstraints()
    }
    
    private func configBackGroundColor() {
        backgroundColor = .brown
    }
    
    private func configSuperView() {
        addSubview(welcomeLabel)
        addSubview(tableView)
    }
    
    func delegateTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 45),
            
            tableView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
