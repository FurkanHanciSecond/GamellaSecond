//
//  SettingsViewController.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import UIKit
import UIComponents
final class SettingsViewController: BaseViewController<SettingsViewModel> {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
      
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
        switch section {
        case 0:
           return 1
            
        case 1:
            return 1
            
        case 2:
            return 1
            
        default:
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: SettingsCell = self.tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseIdentifier, for: indexPath) as! SettingsCell
            cell.backgroundColor = .red
            return cell
        } else if indexPath.row == 1 {
            let cell2: SettingsSecondCell = self.tableView.dequeueReusableCell(withIdentifier: SettingsSecondCell.reuseIdentifier, for: indexPath) as! SettingsSecondCell
            return cell2
        } else if indexPath.row == 2 {
            let cell3: SettingsThirdCell =  self.tableView.dequeueReusableCell(withIdentifier: SettingsThirdCell.reuseIdentifier, for: indexPath) as! SettingsThirdCell
            return cell3
        }
        
        return UITableViewCell()

    }
}

// MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    
}


