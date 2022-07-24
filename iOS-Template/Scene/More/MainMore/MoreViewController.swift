//
//  MoreViewController.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import UIKit

final class MoreViewController: BaseViewController<MoreViewModel> {
    
    private let refreshControl = UIRefreshControl()
    
    private let tableView: UITableView = {
       let table = UITableView()
        table.register(MoreCell.self)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        subscribeViewModel()
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
        tableView.refreshControl = refreshControl
        self.tableView.delegate = self
        self.tableView.dataSource = self
        addBarButtons()
    }
    
    private func addBarButtons() {
        let firstBarButton = UIBarButtonItem(image: AppConstants.Style.Image.grid, style: .plain, target: self, action: #selector(firstBarButtonHandle(_:)))
        firstBarButton.tintColor = AppConstants.Style.Color.labelColor
        
        let secondBarButton = UIBarButtonItem(image: AppConstants.Style.Image.swirlCircle, style: .plain, target: self, action: #selector(secondBarButtonHandle(_:)))
        
        self.navigationItem.rightBarButtonItems = [firstBarButton , secondBarButton]
    }
}

// MARK: - UILayout
extension MoreViewController {
    private func addSubViews() {
        addTableView()
        refreshControl.addTarget(self, action: #selector(pullToRefreshValueChanged), for: .valueChanged)
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        self.tableView.pinToCorners(to: view)
    }
}

// MARK: -  SubscribeViewModel
extension MoreViewController {
    
    private func subscribeViewModel() {
        viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
}

// MARK: - Actions
extension MoreViewController {
    @objc
    private func pullToRefreshValueChanged() {
        viewModel.cellItems.isEmpty ? viewModel.refreshData() : self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    @objc private func firstBarButtonHandle(_ sender: UIBarButtonItem) {
        print("first")
    }
    
    @objc private func secondBarButtonHandle(_ sender: UIBarButtonItem) {
        print("second")
    }
}

// MARK: - UITableViewDelegate
extension MoreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 0, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.5
        
        UIView.animate(withDuration: 0.5) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 2.0
        }
    }
}

// MARK: - UITableViewDelegate
extension MoreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MoreCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: viewModel.cellForItemAt(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.numberOfItems == 0 {
            tableView.setEmptyView(message: "No Data!", image: UIImage(systemName: "exclamationmark.triangle.fill")!)
        } else {
            tableView.restoreTableView()
        }
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(indexPath: indexPath)
    }
}
