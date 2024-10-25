//
//  ViewController.swift
//  35-Seminar
//
//  Created by  정지원 on 10/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    //    private var redView: UIView = {
    //        var view = UIView(frame: CGRect(origin: CGPoint(x:0, y:0), size: CGSize(width: 100, height: 100)))
    //        view.backgroundColor = .red
    //        return view
    //    }()
    
    // MARK: - UI Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오톡"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0 //몇 줄이 들어올 지 예측을 못할 때
        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목을 입력해주세요."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        //텍스트필드 눌렀을 떄 어떤 형태의 키보드가 뜨는 지 설정
        textField.keyboardType = .default
        return textField
    }()
    
    private let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14)
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        return textView
    }()
    
    // 버튼은 누를 수도 있고 안 누를 수도 있음. lazy var가 뭔 지 알아오기.
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var pushModeToggleButton: UIButton = {
        let button = UIButton()
        button.setTitle("전환 모드 변경", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var pushMode = true
    
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
        updateUI()
    }
    
    private func setUI() {
        [titleLabel, titleTextField, contentTextView, nextButton, pushModeToggleButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 20
                ),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                titleTextField.topAnchor.constraint(
                    equalTo: titleLabel.bottomAnchor,
                    constant: 20
                ),
                titleTextField.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                titleTextField.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                titleTextField.heightAnchor.constraint(equalToConstant: 40),
                
                contentTextView.topAnchor.constraint(
                    equalTo: titleTextField.bottomAnchor,
                    constant: 20
                ),
                contentTextView.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                contentTextView.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                contentTextView.heightAnchor.constraint(
                    equalToConstant: 200
                ),
                
                nextButton.topAnchor.constraint(
                    equalTo: contentTextView.bottomAnchor,
                    constant: 20
                ),
                nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nextButton.heightAnchor.constraint(equalToConstant: 50),
                nextButton.widthAnchor.constraint(equalToConstant: 100),
                
                pushModeToggleButton.topAnchor.constraint(
                    equalTo: nextButton.bottomAnchor,
                    constant: 20
                ),
                pushModeToggleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                pushModeToggleButton.heightAnchor.constraint(equalToConstant: 44),
                pushModeToggleButton.widthAnchor.constraint(equalToConstant: 300),
            ]
        )
    }
    
    private func updateUI() {
        self.titleLabel.text = pushMode ? "네비게이션" : "모달"
    }
    
    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        //텍스트필드가 유효한 지를 검사
        guard let title = titleTextField.text,
              let content = contentTextView.text
        else {
            // 텍스트의 값들이 없으면 함수가 return
            return
        }
        // 존재할 경우 함수를 그대로 실행
        nextViewController.dataBind(title: title, content: content)
        
        if pushMode {
            self.navigationController?.pushViewController(
                nextViewController,
                animated: true
            )
        } else {
            //push하기 위해 instance를 생성하는 것 -> 모르면 문법 공부
            self.present(
                nextViewController,
                animated: true
            )
        }
    }
    
    // MARK: - @objc Func
    
    @objc func nextButtonTapped() {
        transitionToNextViewController()
    }
    
    @objc func toggleButtonTapped() {
        self.pushMode.toggle()
        self.updateUI()
    }
    
}

