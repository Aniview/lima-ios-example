//
//  AutoGrowingTextEditor.swift
//  LimaQA
//
//  Created by Pavlo Yevtukhov on 18.07.2025.
//

import SwiftUI

struct AutoGrowingTextEditor: View {
    @Binding var text: String

    private let font = Font.body

    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                // Hidden text for measuring
                Text(text + " ")
                    .font(font)
                    .foregroundColor(.clear)
                    .padding(10)
                    .hidden()

                TextEditor(text: $text)
                    .font(font)
                    .padding(4)
                    .background(Color.clear)
            }
        }
    }
}
