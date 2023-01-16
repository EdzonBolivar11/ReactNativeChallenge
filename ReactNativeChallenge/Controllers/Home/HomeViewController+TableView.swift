//
//  HomeViewController+TableView.swift
//  ReactNativeChallenge
//
//  Created by Edzon Bolivar on 13/01/23.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.tableView.backgroundColor = .clear
        self.tableView.separatorColor = .clear

        self.registerCells()
    }

    func registerCells() {
        self.tableView.register(CategoryCell.register(), forCellReuseIdentifier: CategoryCell.identifier)
    }

    func realoadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        self.viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else {
            return UITableViewCell()
        }

        cell.setupCell(viewModel: cellDataSource[indexPath.row])
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
