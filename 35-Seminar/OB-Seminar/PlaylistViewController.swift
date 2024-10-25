//
//  PlayerViewController.swift
//  35-Seminar
//
//  Created by  정지원 on 10/25/24.
//

import UIKit

import SnapKit
import Then

class PlaylistViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let songStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
    }
    
    let songView1 = UIView().then {
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 10
    }
    
    let songView2 = UIView().then {
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 10
    }
    
    let songView3 = UIView().then {
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 10
    }
    
    let songView4 = UIView().then {
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 10
    }
    
    var musicDetailViewController: MusicDetailViewController?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupHierarchy()
        setupLayout()
        setupTargets()
    }
    
    // MARK: - Setup Methods
    
    private func setupStyle() {
        view.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        view.addSubview(songStackView)
        songStackView.addArrangedSubview(songView1)
        songStackView.addArrangedSubview(songView2)
        songStackView.addArrangedSubview(songView3)
        songStackView.addArrangedSubview(songView4)
    }
    
    private func setupLayout() {
        songStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }
        
        setupSongLayout(songView: songView1, title: "In the Club", artist: "TAUFIQ AKMAL")
        
        setupSongLayout(songView: songView2, title: "Never Give Up", artist: "NEFFEX")
        
        setupSongLayout(songView: songView3, title: "Money Making Song", artist: "폴블랑코")
        
        setupSongLayout(songView: songView4, title: "Tough Cookie", artist: "ZICO")
    }
    
    private func setupSongLayout(songView: UIView, title: String, artist: String) {
        let titleLabel = UILabel().then {
            $0.text = title
            $0.font = UIFont.boldSystemFont(ofSize: 18)
        }
        
        let artistLabel = UILabel().then {
            $0.text = artist
            $0.font = UIFont.systemFont(ofSize: 14)
            $0.textColor = .red
        }
        
        songView.addSubviews([titleLabel, artistLabel])
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(15)
        }
        
        artistLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    private func setupTargets() {
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
        songView1.addGestureRecognizer(tapGesture1)
        songView2.addGestureRecognizer(tapGesture2)
        songView3.addGestureRecognizer(tapGesture3)
        songView4.addGestureRecognizer(tapGesture4)
    }
    
    // MARK: - @objc Func
    
    @objc private func handleTap() {
        musicDetailViewController = MusicDetailViewController()
        if let musicDetailViewController = musicDetailViewController {
            musicDetailViewController.modalPresentationStyle = .overFullScreen
            present(musicDetailViewController, animated: true, completion: nil)
        }
    }
}
