//
//  NicknameViewController.swift
//  35-Seminar
//
//  Created by  정지원 on 10/12/24.
//

import UIKit

import SnapKit

class NicknameViewController: UIViewController{
    
    // MARK: - UI Properties
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "빈 라벨"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0 //몇 줄이 들어올 지 예측을 못할 때
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    // MARK: - Private Func
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setUI() {
        [nicknameLabel, nextButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate(
            [
                nicknameLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 20
                ),
                nicknameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                nextButton.topAnchor.constraint(
                    equalTo: nicknameLabel.bottomAnchor,
                    constant: 50
                ),
                nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nextButton.heightAnchor.constraint(equalToConstant: 50),
                nextButton.widthAnchor.constraint(equalToConstant: 100),
            ]
        )
    }
    
    @objc func nextButtonTapped() {
//      let nicknameViewController = NicknameViewController_Delegate()
//      nicknameViewController.delegate = self
        
        let nicknameViewController = NicknameViewController_Closure()
        
        nicknameViewController.completionHandler = { [weak self] nickname in
            guard let self else { return }
            self.nicknameLabel.text = nickname
          }
      self.navigationController?.pushViewController(nicknameViewController, animated: true)
    }
}

//extension NicknameViewController: NicknameDelegate {
//    func dataBind(nickname: String) {
//        self.nicknameLabel.text = nickname
//    }
//}
    
