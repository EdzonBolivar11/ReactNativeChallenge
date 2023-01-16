//
//  CommonModels.swift
//  ReactNativeChallenge
//
//  Created by Edzon Bolivar on 10/01/23.
//

import Foundation

// MARK: - Links

struct Links: Codable {
    let first, next, last: String
}

// MARK: - Meta

struct Meta: Codable {
    let count: Int
}

// MARK: - SelfLink

struct SelfLink: Codable {
    let linksSelf: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - Relationships

struct Relationships: Codable {
    let parent, anime, drama, manga: SelfRelatedLinks
}

// MARK: - Anime

struct SelfRelatedLinks: Codable {
    let links: SelfRelatedLink
}

// MARK: - AnimeLinks

struct SelfRelatedLink: Codable {
    let linksSelf, related: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case related
    }
}
