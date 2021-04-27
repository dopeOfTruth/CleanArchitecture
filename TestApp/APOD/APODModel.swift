//
//  APOD.swift
//  TestApp
//
//  Created by Михаил Красильник on 27.04.2021.
//

import Foundation

// MARK: - Welcome
struct APODModel: Codable {
    let date, explanation, mediaType, serviceVersion: String
    let title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case date, explanation
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}
