//
//  AnimalTableViewCell.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 01/12/22.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    static let identifier: String = "AnimalTableViewCell"
    
    lazy var animalTableViewScreen: AnimalTableViewScreen = {
        let view = AnimalTableViewScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configBackGround()
        configSuperView()
        configConstraints()
    }
    
    private func configBackGround() {
        backgroundColor = .clear
    }
    
    private func configSuperView() {
        animalTableViewScreen.layer.cornerRadius = 6.0
        contentView.addSubview(animalTableViewScreen)
    }
    
    public func setUpCell(data: Showable) {
        animalTableViewScreen.nameAnimalLabel.text = data.callName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            animalTableViewScreen.topAnchor.constraint(equalTo: topAnchor),
            animalTableViewScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            animalTableViewScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            animalTableViewScreen.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
