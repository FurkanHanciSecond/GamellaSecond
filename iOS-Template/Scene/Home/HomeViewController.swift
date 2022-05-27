//
//  HomeViewController.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/22/22.
//

import UIKit
import UIComponents
import Utilities
import MobilliumUserDefaults
final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HomeCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppConstants.Style.Color.indigo
        viewModel.didload()
        configrueContents()
        configrueNavigationBar()
    }
}

// MARK: - Configure
extension HomeViewController {
    private func configrueContents() {
        title = "Hello \(DefaultsKey.userName.value ?? "Empty")"
    }
    
    private func configrueNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeCell = tableView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}
