//
//  AnimalTableViewScreen.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 01/12/22.
//

import UIKit

class AnimalTableViewScreen: UIView {

    lazy var nameAnimalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSuperView()
        configConstraints()
        
    }
    
    func configSuperView() {
        addSubview(nameAnimalLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            nameAnimalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameAnimalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameAnimalLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameAnimalLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
