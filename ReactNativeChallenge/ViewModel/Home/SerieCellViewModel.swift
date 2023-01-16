//
//  SerieCellViewModel.swift
//  ReactNativeChallenge
//
//  Created by Edzon Bolivar on 13/01/23.
//

import Foundation

class SerieCellViewModel {
    var id: Int
    var title: String
    var imageURL: URL?

    init(serie: Serie) {
        self.id = Int(serie.id) ?? 0
        self.title = serie.attributes.canonicalTitle ?? "Sin titulo"
        self.imageURL = makeImageURL(serie.attributes.coverImage?.original ?? "")
    }

    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: imageCode)
    }
}
