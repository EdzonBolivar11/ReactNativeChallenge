//
//  NetworkConstants.swift
//  ReactNativeChallenge
//
//  Created by Edzon Bolivar on 12/01/23.
//

import Foundation

class NetworkConstant {
    public static var shared: NetworkConstant = .init()

    private init() {}

    public var baseURL: String {
        "https://kitsu.io/api/edge/"
    }

    public var getAnime: String {
        baseURL + "anime"
    }

    public var getCategories: String {
        baseURL + "categories"
    }
}
