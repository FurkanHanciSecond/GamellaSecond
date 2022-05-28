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
    
    private let homeTableView: UITableView = {
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
        addSubViews()
        subscribeViewModel()
    }
}


// MARK: -  UI Layout

extension HomeViewController {
    private func addSubViews() {
        addTableView()
    }
    
    private func addTableView() {
        view.addSubview(homeTableView)
        homeTableView.edgesToSuperview()
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

// MARK: - SubscribeViewModel
extension HomeViewController {
    private func subscribeViewModel() {
        viewModel.reloadData = { [ weak self ] in
            guard let self = self else { return }
            self.homeTableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeCell = tableView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}
