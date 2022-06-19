//
//  SortViewController.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import UIKit
import UIComponents
import TinyConstraints
final class SortViewController: BaseViewController<SortViewModel> {
    
    private lazy var sortTableView: UITableView = {
       let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(SortCell.self)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        viewModel.didload()
        view.backgroundColor = viewModel.backgroundColor
    }
    
}

// MARK: - UI Layout
extension SortViewController {
    private func addSubViews() {
        addTableView()
    }
    
    private func addTableView() {
        view.addSubview(sortTableView)
        sortTableView.pinToCorners(to: view)
        sortTableView.separatorStyle = .none
        sortTableView.backgroundView = nil
    }
}

// MARK: - Configures
extension SortViewController {
    private func configureContents() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - TableViewDataSource
extension SortViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SortCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: viewModel.cellForItemAt(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
}

// MARK: - TableViewDelegate {
extension SortViewController: UITableViewDelegate {
    
}
