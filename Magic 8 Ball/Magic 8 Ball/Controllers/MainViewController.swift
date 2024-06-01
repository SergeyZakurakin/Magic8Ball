//
//  MainViewController.swift
//  Magic 8 Ball
//
//  Created by Sergey Zakurakin on 22/05/2024.
//

import UIKit

final class MainViewController: UIViewController {

    private var ballImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ball1")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        return imageView
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .scaleAspectFit
        label.text = "Ask question and press button"
        label.textAlignment = .center
        label.textColor = .blue
        label.font = .systemFont(ofSize: 24)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var askButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ask Me...", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(askButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 12
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // #imageLiteral(
    @objc func askButtonPressed() {
        ballImageView.image = [#imageLiteral(resourceName: "ball5"), #imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball5")].randomElement()
        ballImageView.isHidden = false
        questionLabel.text = "Ask again and press button"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = .cyan
        
        view.addSubview(ballImageView)
        ballImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ballImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60).isActive = true
        
        view.addSubview(askButton)
        askButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160).isActive = true
        askButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        askButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        askButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(questionLabel)
        questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }

}

