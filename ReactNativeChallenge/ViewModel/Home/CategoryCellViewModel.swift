//
//  CategoryCellViewModel.swift
//  ReactNativeChallenge
//
//  Created by Edzon Bolivar on 14/01/23.
//

import Foundation

class CategoryCellViewModel {
    var title: String
    var seriesList: Observable<[SerieCellViewModel]> = Observable(nil)

    func numberOfSections() -> Int { 1 }

    func numberOfRows(in section: Int) -> Int { seriesList.value?.count ?? 0 }

    init(category: Category?) {
        if category != nil {
            self.title = category?.attributes.title ?? "Sin título"
            mapData(category: category ?? nil)
        } else {
            self.title = "Sin título"
        }
    }

    private func mapData(category: Category?) {
        seriesList.value = category?.childrenSerieResponse?.data.compactMap { SerieCellViewModel(serie: $0) }
    }
}
