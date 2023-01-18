//
//  CategoryCell+CollectionView.swift
//  ReactNativeChallenge
//
//  Created by Edzon Bolivar on 14/01/23.
//

import Foundation
import UIKit

extension CategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func setupCollectionView() {
        self.seriesCollectionView.delegate = self
        self.seriesCollectionView.dataSource = self
        
        if let layout = self.seriesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }

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

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewDataSource.value?.count ?? 0 }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SerieCell.identifier, for: indexPath) as? SerieCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(viewModel: (collectionViewDataSource.value?[indexPath.row])!)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: (self.seriesCollectionView.frame.width - 30)/3, height: (self.seriesCollectionView.frame.height - 10)/2)
    }
}
