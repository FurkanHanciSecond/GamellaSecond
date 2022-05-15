//
//  ExampleViewController.swift
//  iOS-Template
//
//  Created by Ercan Garip on 6.05.2022.
//

import UIKit
import TinyConstraints
import UIComponents
import MobilliumBuilders

final class ExampleViewController: BaseViewController<ExampleViewModel> {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ExampleCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        subscriveViewModel()
        viewModel.viewDidLoad()
    }
}

// MARK: - UILayout
extension ExampleViewController {
    
    private func addSubViews() {
        addTableView()
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
    }
}

// MARK: - Configure
extension ExampleViewController {
    
    private func configureContents() {
        title = "Example Scene"
    }
}

// MARK: -  SubscribeViewModel
extension ExampleViewController {
    
    private func subscriveViewModel() {
        viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
}

// MARK: -  UITableViewDelegate
extension ExampleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(indexPath: indexPath)
    }
}

// MARK: - UITableViewDataSource
extension ExampleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ExampleCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: viewModel.cellForItemAt(indexPath: indexPath))
        return cell
    }
}
