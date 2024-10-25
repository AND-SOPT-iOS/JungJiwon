//
//  MusicDetailViewController.swift
//  35-Seminar
//
//  Created by  정지원 on 10/25/24.
//
import UIKit

import SnapKit
import Then

class MusicDetailViewController: UIViewController {

    // MARK: - UI Properties
    
    let albumImageView = UIImageView().then {
        $0.image = UIImage(named: "album_image")
        $0.contentMode = .scaleAspectFit
    }
    
    let titleLabel = UILabel().then {
        $0.text = "In the Club"
        $0.font = UIFont.boldSystemFont(ofSize: 22)
        $0.textColor = .white
    }
    
    let artistLabel = UILabel().then {
        $0.text = "TAUFIQ AKMAL"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .lightGray
    }
    
    let playButton = UIButton(type: .system).then {
        $0.setTitle("▶︎", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        $0.tintColor = .white
        $0.addTarget(MusicDetailViewController.self, action: #selector(playPauseTapped), for: .touchUpInside)
    }
    
    let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 20
    }
    
    let infoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 5
    }

    var panGestureRecognizer: UIPanGestureRecognizer!

    var isMinimized = false
    var maxHeight: CGFloat = UIScreen.main.bounds.height
    var minHeight: CGFloat = 100

    var imageHeightConstraint: Constraint!
    var imageWidthConstraint: Constraint!

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupHierarchy()
        setupLayout()
        setupGesture()
    }

    // MARK: - Private Func
    
    private func setupStyle() {
        view.backgroundColor = .purple
    }

    private func setupHierarchy() {
        // infoStackView에 제목과 아티스트 추가
        infoStackView.addArrangedSubview(titleLabel)
        infoStackView.addArrangedSubview(artistLabel)
        
        // 메인 스택뷰에 앨범 이미지, infoStackView, 재생 버튼 추가
        stackView.addArrangedSubview(albumImageView)
        stackView.addArrangedSubview(infoStackView)
        stackView.addArrangedSubview(playButton)
        
        // 스택뷰를 뷰에 추가
        view.addSubview(stackView)
    }

    private func setupLayout() {
        // 제약 조건 설정
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }

        // 앨범 이미지 뷰 제약 조건
        albumImageView.snp.makeConstraints { make in
            imageWidthConstraint = make.width.equalTo(250).constraint
            imageHeightConstraint = make.height.equalTo(250).constraint
        }
    }

    private func setupGesture() {
        // Pan 제스처 인식기 추가
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGestureRecognizer)
    }

    // MARK: - Pan Gesture Handling
    
    @objc private func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)

        if gesture.state == .changed {
            if translation.y > 0 {
                view.frame = CGRect(x: 0, y: translation.y, width: view.frame.width, height: maxHeight - translation.y)
            }
        } else if gesture.state == .ended {
            if velocity.y > 0 {
                minimizeView()
            } else {
                maximizeView()
            }
        }
    }

    // MARK: - View Transitions
    
    private func minimizeView() {
        UIView.animate(withDuration: 0.3) {
            self.view.frame = CGRect(x: 0, y: self.maxHeight - self.minHeight, width: self.view.frame.width, height: self.minHeight)

            // 스택뷰 가로 방향 변경
            self.stackView.axis = .horizontal
            self.stackView.alignment = .center
            self.stackView.spacing = 10

            // 이미지 크기 축소
            self.imageHeightConstraint.update(offset: 60)
            self.imageWidthConstraint.update(offset: 60)
            self.albumImageView.layer.cornerRadius = 5
            self.albumImageView.clipsToBounds = true
            
            // 제목 및 아티스트 레이블 크기 축소
            self.titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
            self.artistLabel.font = UIFont.systemFont(ofSize: 12)
            
            // 재생 버튼 크기 축소
            self.playButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)

            self.stackView.layoutIfNeeded()
        }
        isMinimized = true
    }

    private func maximizeView() {
        UIView.animate(withDuration: 0.3) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.maxHeight)

            // 스택뷰 세로 방향 변경
            self.stackView.axis = .vertical
            self.stackView.alignment = .center
            self.stackView.spacing = 20

            // 이미지 크기 복원
            self.imageHeightConstraint.update(offset: 250)
            self.imageWidthConstraint.update(offset: 250)
            self.albumImageView.layer.cornerRadius = 0
            self.albumImageView.clipsToBounds = false

            // 제목 및 아티스트 레이블 크기 복원
            self.titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
            self.artistLabel.font = UIFont.systemFont(ofSize: 16)
            
            // 재생 버튼 크기 복원
            self.playButton.titleLabel?.font = UIFont.systemFont(ofSize: 32)

            self.stackView.layoutIfNeeded()
        }
        isMinimized = false
    }
    
    @objc private func playPauseTapped() {
        print("재생/정지 버튼 눌림")
    }
}
