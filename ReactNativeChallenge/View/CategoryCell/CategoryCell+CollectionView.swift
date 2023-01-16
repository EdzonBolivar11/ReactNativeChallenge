//
//  CategoryCell+CollectionView.swift
//  ReactNativeChallenge
//
//  Created by Edzon Bolivar on 14/01/23.
//

import Foundation
import UIKit

extension CategoryCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func setupTableView() {
        self.seriesCollectionView.delegate = self
        self.seriesCollectionView.dataSource = self

        self.seriesCollectionView.backgroundColor = .clear

        self.registerCells()
    }

    func registerCells() {
        self.seriesCollectionView.register(SerieCell.register(), forCellWithReuseIdentifier: SerieCell.identifier)
    }

    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.seriesCollectionView.reloadData()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { collectionViewDataSource.value?.count ?? 0 }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SerieCell.identifier, for: indexPath) as? SerieCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(viewModel: (collectionViewDataSource.value?[indexPath.row])!)

        return cell
    }
}
