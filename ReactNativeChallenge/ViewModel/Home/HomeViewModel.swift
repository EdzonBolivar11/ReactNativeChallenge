//
//  HomeViewModel.swift
//  ReactNativeChallenge
//
//  Created by Edzon Bolivar on 12/01/23.
//

import Foundation

class HomeViewModel {
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSoruce: Observable<[CategoryCellViewModel]> = Observable(nil)
    var dataSource: CategoriesModelResponse?

    func numberOfSections() -> Int { 1 }

    func numberOfRows(in section: Int) -> Int { dataSource?.data.count ?? 0 }

    func getData() {
        if isLoading.value ?? true { return }

        isLoading.value = true
        
        

        NetworkService.getCategories { [weak self] result in
            let dispatchGroup = DispatchGroup()
            
            switch result {
            case .success(let data):
                
                var categories = data

                for i in 0 ..< categories.data.count {
                    dispatchGroup.enter()
                    NetworkService.getSeriesByCategory(categoryURL: categories.data[i].relationships.anime.links.related) { response in
                        dispatchGroup.leave()
                        switch response {
                        case .success(let dataCategory):                            
                            categories.data[i].childrenSerieResponse = dataCategory
                        case .failure:
                            categories.data[i].childrenSerieResponse = nil
                        }
                    }
                }
                
                dispatchGroup.notify(queue: DispatchQueue.main) { [weak self] in
                    self?.isLoading.value = false
                    self?.dataSource = categories
                    self?.mapData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }

    func mapData() {
        cellDataSoruce.value = dataSource?.data.compactMap { CategoryCellViewModel(category: $0) }
    }
}
