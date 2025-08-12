//
//  URLMergeViewModel.swift
//  LimaQA
//
//  Created by Pavlo Yevtukhov on 18.07.2025.
//

import Foundation
import Lima

enum ParamStatus {
    case added, replaced, unchanged
}

struct ParamDiffItem {
    let key: String
    let value: String
    let status: ParamStatus
}

private let initialUrl = "https://vast.aniview.com/api/adserver6/vast/?AV_PUBLISHERID=565c56d3181f46bd608b459a&AV_CHANNELID=6878b850626df1e8ed0d8af8&AV_UUID=983999bf-77f6-432b-9650-ab6252215189&AV_APPNAME=Lima%20Example&AV_APPPKGNAME=com.adservrs.lima.example.ima&AV_URL=com.adservrs.lima.example.ima&AV_APPSTOREURL=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.adservrs.lima.example.ima&AV_GDPR=0&AV_CONNECTIONTYPE=2&d39=lima-1.0.3&d44=120&d50=94c3c43f-e1e7-4cc0-a47e-a077d429fb8b&d41=983999bf-77f6-432b-9650-ab6252215189&d47=0&AV_AID=52f08c7a-ecc1-4579-8b62-b8845486a68c&AV_APPSETID=1f291541-9f9b-cf87-61d0-c2c681978f12"


final class URLMergeViewModel: ObservableObject {

    @Published var originalURL = initialUrl {
        didSet {
            update()
        }
    }
    @Published var enrichedURL = ""
    @Published var diff: [ParamDiffItem] = []

    func onViewAppear() {
        update()
    }

    private func update() {
        enrichedURL = LimaUtil.shared.enrichVastUrl(originalURL)
        diff = computeParamDiffs(originalURL, enrichedURL)
    }

    private func computeParamDiffs(_ original: String, _ enriched: String) -> [ParamDiffItem] {
        let originalParams = extractParams(from: original)
        let enrichedParams = extractParams(from: enriched)

        var diffs: [ParamDiffItem] = []

        for (key, value) in enrichedParams.sorted(by: { $0.key < $1.key }) {
            if let origVal = originalParams[key] {
                if origVal != value {
                    diffs.append(.init(key: key, value: value, status: .replaced))
                } else {
                    diffs.append(.init(key: key, value: value, status: .unchanged))
                }
            } else {
                diffs.append(.init(key: key, value: value, status: .added))
            }
        }

        return diffs
    }

    private func extractParams(from urlString: String) -> [String: String] {
        guard let components = URLComponents(string: urlString),
              components.host != nil,
              let items = components.queryItems else { return [:] }
        return items.reduce(into: [String: String]()) { dict, item in
            dict[item.name] = item.value
        }
    }
}
