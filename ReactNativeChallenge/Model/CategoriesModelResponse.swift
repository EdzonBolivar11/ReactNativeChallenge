//
//  Category.swift
//  ReactNativeChallenge
//
//  Created by Edzon Bolivar on 10/01/23.
//
//   let categoriesResponse = try? JSONDecoder().decode(CategoriesResponse.self, from: jsonData)

//
// To parse values from Alamofire responses:
//

import Foundation

// MARK: - CategoriesResponse

struct CategoriesModelResponse: Codable {
    var data: [Category]
    let meta: Meta
    let links: Links
}

// MARK: - Category

struct Category: Codable {
    let id: String
    let type: String
    let links: SelfLink
    let attributes: CategoryAttributes
    let relationships: Relationships

    var childrenSerieResponse: CategorySeriesModel?
}

// MARK: - CategoryAttributes

struct CategoryAttributes: Codable {
    let createdAt, updatedAt, title, description: String
    let totalMediaCount: Int
    let slug: String
    let nsfw: Bool
    let childCount: Int
}
