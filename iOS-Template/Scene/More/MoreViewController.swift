//
//  MoreViewController.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import UIKit

final class MoreViewController: BaseViewController<MoreViewModel> {
    
    private let tableView: UITableView = {
       let table = UITableView()
        table.register(MoreCell.self)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        addSubViews()
    }
    
}

// MARK: - Configure
extension MoreViewController {
    private func configureContents() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

// MARK: - UILayout
extension MoreViewController {
    private func addSubViews() {
        addTableView()
    }
    
    private func addTableView() {
        self.tableView.pinToCorners(to: view)
    }
}


// MARK: - UITableViewDelegate
extension MoreViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDelegate
extension MoreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    }
}
