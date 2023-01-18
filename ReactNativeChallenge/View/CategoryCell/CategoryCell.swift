//
//  CategoryCell.swift
//  ReactNativeChallenge
//
//  Created by Edzon Bolivar on 14/01/23.
//

import UIKit

class CategoryCell: UITableViewCell {
    @IBOutlet var titleSectionLbl: UILabel!
    @IBOutlet var seriesCollectionView: UICollectionView!

    var viewModel: CategoryCellViewModel = .init(category: nil)

    var collectionViewDataSource: Observable<[SerieCellViewModel]> = Observable(nil)

    static var identifier: String {
        "CategoryCell"
    }

    static func register() -> UINib {
        UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bindViewModel()
    }

    func setupCell(viewModel: CategoryCellViewModel) {
        titleSectionLbl.text = viewModel.title

        setupCollectionView()
        collectionViewDataSource = viewModel.seriesList
    }

    func bindViewModel() {
        viewModel.seriesList.bind { [weak self] seriesList in
            guard let self = self,
                  let seriesList = seriesList
            else {
                return
            }
            self.collectionViewDataSource.value = seriesList
            self.reloadCollectionView()
        }
    }
}
