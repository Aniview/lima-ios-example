//
//  ContentView.swift
//  LimaQA
//
//  Created by Pavlo Yevtukhov on 17.07.2025.
//

import SwiftUI

struct URLMergeView: View {
    @StateObject private var viewModel = URLMergeViewModel()

    var body: some View {
        
       ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Enter URL")
                    .font(.headline)

                AutoGrowingTextEditor(text: $viewModel.originalURL)
                    .padding(8)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                Text("Enriched URL:")
                    .font(.headline)

                Text(viewModel.enrichedURL)
                    .font(.body)
                    .foregroundColor(.blue)
                    .textSelection(.enabled)
                    .padding(.vertical, 4)

                Divider()

                Text("Parameters:")
                    .font(.headline)

                VStack(alignment: .leading, spacing: 8) {
                    ForEach(viewModel.diff, id: \.key) { item in
                        Text("\(item.key): \(item.value)")
                            .foregroundColor(color(for: item.status))
                            .font(.body)
                    }
                }
            }
            .padding()
       }.onAppear {
           viewModel.onViewAppear()
       }
    }



    func color(for status: ParamStatus) -> Color {
        switch status {
        case .added: return .green
        case .replaced: return .blue
        case .unchanged: return .black
        }
    }
}

struct URLMergeView_Previews: PreviewProvider {
    static var previews: some View {
        URLMergeView()
    }
}
