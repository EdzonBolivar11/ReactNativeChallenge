//
//  HomeViewController.swift
//  ReactNativeChallenge
//
//  Created by Edzon Bolivar on 12/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    var viewModel: HomeViewModel = .init()

    var cellDataSource: [CategoryCellViewModel] = .init()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configView()
        self.bindViewModel()
    }

    func configView() {
        self.view.backgroundColor = .black
        self.title = "Hola"

        setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel.getData()
    }

    func bindViewModel() {
        self.viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }

            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }

        self.viewModel.cellDataSoruce.bind { [weak self] categories in
            guard let self = self, let categories = categories else {
                return
            }

            self.cellDataSource = categories
            self.realoadTableView()
        }
    }
}
