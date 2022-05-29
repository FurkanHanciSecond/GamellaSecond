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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        subscribeViewModel()
        viewModel.viewDidLoad()
    }
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubViews() {
        addTableView()
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        tableView.pinToCorners(to: view)
        tableView.separatorStyle = .none
    }
}

// MARK: - Configure
extension HomeViewController {
    
    private func configureContents() {
        title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        addBarButton()
    }
    
    private func addBarButton() {
        let navBarButton = UIBarButtonItem(image: AppConstants.Style.Image.grid, style: .plain, target: self, action: #selector(gridButtonHandle(_:)))
        navBarButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = navBarButton
    }
    
    @objc private func gridButtonHandle(_ sender: UIBarButtonItem) {
        print("grid")
    }
}

// MARK: -  SubscribeViewModel
extension HomeViewController {
    
    private func subscribeViewModel() {
        viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
}

// MARK: -  UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(indexPath: indexPath)
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: viewModel.cellForItemAt(indexPath: indexPath))
        return cell
    }
}
