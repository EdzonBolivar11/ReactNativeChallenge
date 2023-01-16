//
//  TableViewCell.swift
//  ReactNativeChallenge
//
//  Created by Edzon Bolivar on 13/01/23.
//

import SDWebImage
import UIKit

class SerieCell: UICollectionViewCell {
    static var identifier: String {
        "SerieCell"
    }

    static func register() -> UINib {
        UINib(nibName: "SerieCell", bundle: nil)
    }

    @IBOutlet var titleView: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(viewModel: SerieCellViewModel) {
        titleView.text = viewModel.title
        //    imageSerieView.sd_setImage(with: viewModel.imageURL)
    }
}
