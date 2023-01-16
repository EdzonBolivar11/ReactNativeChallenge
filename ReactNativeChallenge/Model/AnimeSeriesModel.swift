//
//  AnimeSeriesModel.swift
//  ReactNativeChallenge
//
//  Created by Edzon Bolivar on 12/01/23.
//

import Foundation

// MARK: - AnimeSeriesModel

struct CategorySeriesModel: Codable {
    let data: [Serie]
    let meta: CategoryChildSerieResponseMeta
    let links: CategoryChildSerieResponseLinks
}

// MARK: - Serie

struct Serie: Codable {
    let id: String
    let type: String
    let links: SelfLink
    let attributes: Attributes
    let relationships: [String: RelationshipSerie]
}

// MARK: - Attributes

struct Attributes: Codable {
    let createdAt: String
    let updatedAt: String
    let slug, synopsis, description: String
    let coverImageTopOffset: Int
    let titles: Titles
    let canonicalTitle: String?
    let abbreviatedTitles: [String]
    let averageRating: String
    let ratingFrequencies: [String: String]
    let userCount, favoritesCount: Int
    let startDate, endDate: String
    let nextRelease: JSONNull?
    let popularityRank, ratingRank: Int
    let ageRating: String
    let ageRatingGuide: String
    let subtype: String
    let status: String
    let tba: String?
    let posterImage: PosterImage
    let coverImage: CoverImage?
    let episodeCount, episodeLength, totalLength: Int?
    let youtubeVideoID: String?
    let showType: String
    let nsfw: Bool

    enum CodingKeys: String, CodingKey {
        case createdAt, updatedAt, slug, synopsis, description, coverImageTopOffset, titles, canonicalTitle, abbreviatedTitles, averageRating, ratingFrequencies, userCount, favoritesCount, startDate, endDate, nextRelease, popularityRank, ratingRank, ageRating, ageRatingGuide, subtype, status, tba, posterImage, coverImage, episodeCount, episodeLength, totalLength
        case youtubeVideoID = "youtubeVideoId"
        case showType, nsfw
    }
}

// MARK: - CoverImage

struct CoverImage: Codable {
    let tiny, large, small: String
    let original: String
    let meta: CoverImageMeta
}

// MARK: - CoverImageMeta

struct CoverImageMeta: Codable {
    let dimensions: PurpleDimensions
}

// MARK: - PurpleDimensions

struct PurpleDimensions: Codable {
    let tiny, large, small: Large
}

// MARK: - Large

struct Large: Codable {
    let width, height: Int?
}

// MARK: - PosterImage

struct PosterImage: Codable {
    let tiny, large, small, medium: String
    let original: String
    let meta: PosterImageMeta
}

// MARK: - PosterImageMeta

struct PosterImageMeta: Codable {
    let dimensions: FluffyDimensions
}

// MARK: - FluffyDimensions

struct FluffyDimensions: Codable {
    let tiny, large, small, medium: Large
}

// MARK: - Titles

struct Titles: Codable {
    let en: String?
    let enJp, jaJp: String
    let enUs: String?

    enum CodingKeys: String, CodingKey {
        case en
        case enJp = "en_jp"
        case jaJp = "ja_jp"
        case enUs = "en_us"
    }
}

// MARK: - DatumLinks

struct DatumLinks: Codable {
    let linksSelf: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - Relationship

struct RelationshipSerie: Codable {
    let links: SelfRelatedLink
}

// MARK: - CategoryChildSerieResponseLinks

struct CategoryChildSerieResponseLinks: Codable {
    let first, next, last: String
}

// MARK: - CategoryChildSerieResponseMeta

struct CategoryChildSerieResponseMeta: Codable {
    let count: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
