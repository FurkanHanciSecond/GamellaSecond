//
//  SettingsViewController.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import UIKit
import UIComponents
import StoreKit
final class SettingsViewController: BaseViewController<SettingsViewModel> {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(SettingsCell.self)
        tableView.register(SettingsSecondCell.self)
        tableView.register(SettingsThirdCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
    
}

// MARK: - UILayout
extension SettingsViewController {
    
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
extension SettingsViewController {
    private func configureContents() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: SettingsCell = self.tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseIdentifier, for: indexPath) as! SettingsCell
            cell.delegate = self
            cell.backgroundColor = .clear
            return cell
        } else if indexPath.row == 1 {
            let cell2: SettingsSecondCell = self.tableView.dequeueReusableCell(withIdentifier: SettingsSecondCell.reuseIdentifier, for: indexPath) as! SettingsSecondCell
            cell2.backgroundColor = .green
            return cell2
        } else if indexPath.row == 2 {
            let cell3: SettingsThirdCell =  self.tableView.dequeueReusableCell(withIdentifier: SettingsThirdCell.reuseIdentifier, for: indexPath) as! SettingsThirdCell
            cell3.backgroundColor = .blue
            return cell3
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

// MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    
}

// MARK: - SettingsCellDelegate
extension SettingsViewController: SettingsCellDelegate {
    func feedBackButtonTapped() {
        viewModel.feedBackButtonTapped()
    }
    
    func shareButtonTapped() {
        viewModel.shareButtonTapped()
    }
    
    func rateButtonTapped() {
        guard let scene = view.window?.windowScene else {
            print("scene is not found")
            return
        }
        
        if #available(iOS 14, *) {
            SKStoreReviewController.requestReview(in: scene)
            
        } else {
            SKStoreReviewController.requestReview()
        }
    }
    
    
}


