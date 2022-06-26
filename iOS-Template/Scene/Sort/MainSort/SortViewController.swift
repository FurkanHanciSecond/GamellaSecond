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
        subscribeViewModel()
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

// MARK: - SubscribeViewModel
extension SortViewController {
    private func subscribeViewModel() {
        viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.sortTableView.reloadData()
            }
        }
    }
}

// MARK: - Configures
extension SortViewController {
    private func configureContents() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        addBarButton()
    }
    
    private func addBarButton() {
        let navBarButton = UIBarButtonItem(image: AppConstants.Style.Image.sortIcon, style: .plain, target: self, action: #selector(gridButtonHandle(_:)))
        navBarButton.tintColor = AppConstants.Style.Color.labelColor
        self.navigationItem.rightBarButtonItem = navBarButton
    }
}

// MARK: - Actions
extension SortViewController {
    @objc private func gridButtonHandle(_ sender: UIBarButtonItem) {
        print("sort")
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
        if viewModel.numberOfItems == 0 {
            sortTableView.setEmptyView(message: "No Data!", image: UIImage(systemName: "exclamationmark.triangle.fill")!)
        } else {
            sortTableView.restoreTableView()
        }
        return viewModel.numberOfItems
    }
}

// MARK: - TableViewDelegate {
extension SortViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 500, 0, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.5
        
        UIView.animate(withDuration: 0.5) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 2.0
        }
    }
    
}
