//
//  AcquiredCharacterCell.swift
//  SwiftUI-practice
//
//  Created by  정지원 on 11/30/24.
//


import SwiftUI

struct AcquiredCharacterCell: View {
    let imageName: String
    let name: String
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color(hex: "#5C432F"), lineWidth: 2)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(backgroundColorForImageName(imageName))
                    )
                    .frame(height: 200)
                VStack {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                    Text(name)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color(hex: "#333333"))
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    private func backgroundColorForImageName(_ imageName: String) -> Color {
        switch imageName {
        case "character_1":
            return Color(hex: "#F4E8D5")
        case "character_2":
            return Color(hex: "#FFAA00")
        case "character_3":
            return Color(hex: "#FFD966")
        default:
            return Color.gray
        }
    }
}
