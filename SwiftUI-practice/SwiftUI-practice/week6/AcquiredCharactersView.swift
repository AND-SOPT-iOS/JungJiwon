//
//  AcquiredCharactersView.swift
//  SwiftUI-practice
//
//  Created by  정지원 on 11/30/24.
//

import SwiftUI

struct AcquiredCharactersView: View {
    let characters = [
        ("character_1", "아루"),
        ("character_2", "오푸"),
        ("character_3", "루미"),
        ("character_1", "아루"),
        ("character_2", "오푸"),
        ("character_3", "루미"),
        ("character_1", "아루"),
        ("character_2", "오푸"),
        ("character_3", "루미")
    ]
    
    private let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<9, id: \.self) { index in
                        let character = characters[index % characters.count]
                        AcquiredCharacterCell(imageName: character.0, name: character.1)
                    }
                }
                .padding(.horizontal, 24.5)
            }
            .background(Color(hex: "#D9CAB5"))
        }
        .background(Color(hex: "#FFF7E5"))
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private var headerView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("획득 캐릭터")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(hex: "#333333"))
                Image("baby")
                    .resizable()
                    .frame(width: 26, height: 21)
            }
            
            HStack(spacing: 6) {
                Image("check")
                    .resizable()
                    .frame(width: 16, height: 18)
                Text("퀘스트를 달성하고 보상으로 캐릭터를 얻어보아요!")
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: "#FFAA00"))
            }
        }
    }
}

struct AcquiredCharactersView_Previews: PreviewProvider {
    static var previews: some View {
        AcquiredCharactersView()
            .previewDevice("iPhone 16 Pro")
    }
}
