//
//  NicknameViewController_Closure.swift
//  35-Seminar
//
//  Created by  정지원 on 10/12/24.
//

import UIKit

import SnapKit

class NicknameViewController_Closure: UIViewController {
    
    // MARK: - Properties
    
//    weak var delegate: NicknameDelegate?
    var completionHandler: ((String) -> ())?
    
    // MARK: - UI Properties
    
    private let nicknameTextField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.backgroundColor = .white
        textfield.placeholder = "닉네임을 입력해주세요"
        textfield.clearButtonMode = .whileEditing
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = UIColor.systemBlue.cgColor
        return textfield
    }()
    
    private lazy var nicknameButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(nicknameButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setUI() {
        [
            nicknameTextField,
            nicknameButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate(
            [
                nicknameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                nicknameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                nicknameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                nicknameTextField.heightAnchor.constraint(equalToConstant: 48),
                
                nicknameButton.topAnchor.constraint(equalTo: nicknameTextField.bottomAnchor, constant: 20),
                nicknameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                nicknameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                nicknameButton.heightAnchor.constraint(equalToConstant: 48)
            ]
        )
    }
    
    @objc func nicknameButtonTapped() {
        guard let nickname = nicknameTextField.text else { return }
        completionHandler?(nickname)
        self.navigationController?.popViewController(animated: true)
    }
}


