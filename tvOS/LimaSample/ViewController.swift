//
//  ViewController.swift
//  LimaSample
//
//  Created by Pavlo Yevtukhov on 12.08.2025.
//

import UIKit
import Lima

class ViewController: UIViewController {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()

    private let initialURLLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    private let enrichedURLLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30)
        label.textColor = .blue
        label.numberOfLines = 0
        return label
    }()

    private let initialUrl = "https://vast.aniview.com/api/adserver6/vast/?AV_PUBLISHERID=565c56d3181f46bd608b459a&AV_CHANNELID=6878b850626df1e8ed0d8af8&AV_UUID=983999bf-77f6-432b-9650-ab6252215189&AV_APPNAME=Lima%20Example&AV_APPPKGNAME=com.adservrs.lima.example.ima&AV_URL=com.adservrs.lima.example.ima&AV_APPSTOREURL=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.adservrs.lima.example.ima&AV_GDPR=0&AV_CONNECTIONTYPE=2&d39=lima-1.0.3&d44=120&d50=94c3c43f-e1e7-4cc0-a47e-a077d429fb8b&d41=983999bf-77f6-432b-9650-ab6252215189&d47=0&AV_AID=52f08c7a-ecc1-4579-8b62-b8845486a68c&AV_APPSETID=1f291541-9f9b-cf87-61d0-c2c681978f12"

    override func viewDidLoad() {
        super.viewDidLoad()

        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
        ])
        stackView.addArrangedSubview(initialURLLabel)
        stackView.addArrangedSubview(enrichedURLLabel)

        initialURLLabel.text = "INITIAL: \n" + initialUrl
        enrichedURLLabel.text = "Enriched: \n" + LimaUtil.shared.enrichVastUrl(initialUrl)
    }
}

