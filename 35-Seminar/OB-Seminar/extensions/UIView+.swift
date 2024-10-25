//
//  UIView+.swift
//  35-Seminar
//
//  Created by  정지원 on 10/25/24.
//
import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
}
