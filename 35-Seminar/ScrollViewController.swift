//
//  ScrollViewController.swift
//  35-Seminar
//
//  Created by  정지원 on 10/12/24.
//

import UIKit

import Then
import SnapKit

class ScrollViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let pinkView = UILabel().then {
        $0.backgroundColor = .systemPink
    }
    private let blueView = UILabel().then {
        $0.backgroundColor = .systemBlue
    }
    private let purpleView = UILabel().then {
        $0.backgroundColor = .systemPurple
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [pinkView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
        }
        
        pinkView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(pinkView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(blueView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
        }
    }
}
