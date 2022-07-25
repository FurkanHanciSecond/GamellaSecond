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
import BLTNBoard
final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let refreshControl = UIRefreshControl()
    
    private lazy var bulletinManager: BLTNItemManager = {
        let introPage = BulletinDataSource.makeIntroPage()
           return BLTNItemManager(rootItem: introPage)
       }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
      
        tableView.register(HomeCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        addSubViews()
        configureContents()
        subscribeViewModel()
    
        view.backgroundColor = viewModel.backgroundColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let firstBullet = DefaultsKey.isFirstBulletIn.value {
            if firstBullet {
                presentBulletIn()
            }
        }
        
    }
    
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubViews() {
        addTableView()
        refreshControl.addTarget(self, action: #selector(pullToRefreshValueChanged), for: .valueChanged)
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        tableView.pinToCorners(to: view)
        tableView.separatorStyle = .none
       // tableView.backgroundView = nil
    }
}

// MARK: - Configure
extension HomeViewController {
    
    private func configureContents() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.refreshControl = refreshControl
        tableView.delegate = self
        tableView.dataSource = self
        addBarButton()
    }
    
    private func addBarButton() {
        let navBarButton = UIBarButtonItem(image: AppConstants.Style.Image.grid, style: .plain, target: self, action: #selector(gridButtonHandle(_:)))
        navBarButton.tintColor = AppConstants.Style.Color.labelColor
        self.navigationItem.rightBarButtonItem = navBarButton
    }
    
    private func presentBulletIn() {
        bulletinManager.backgroundViewStyle = .blurredDark
        bulletinManager.edgeSpacing = .regular
        bulletinManager.cardCornerRadius = 36
        bulletinManager.showBulletin(above: self)
    }
}

// MARK: - Actions
extension HomeViewController {
    
    @objc
    private func pullToRefreshValueChanged() {
        viewModel.cellItems.isEmpty ? viewModel.refreshData() : self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    @objc private func gridButtonHandle(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Available Platforms", message: "Please Select a Platform", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Steam", style: .default , handler:{ action in
            self.viewModel.didSelectPopItemAt(platform: "steam")
        }))
        
        alert.addAction(UIAlertAction(title: "Epic Games", style: .default , handler:{ action in
            self.viewModel.didSelectPopItemAt(platform: "epic-games-store")
        }))
        
        alert.addAction(UIAlertAction(title: "Xbox", style: .default , handler:{ action in
            self.viewModel.didSelectPopItemAt(platform: "xbox-series-xs")
        }))
        
        alert.addAction(UIAlertAction(title: "Itchio", style: .default , handler:{ action in
            self.viewModel.didSelectPopItemAt(platform: "itchio")
        }))
        
        alert.addAction(UIAlertAction(title: "Default (PC)", style: .default , handler:{ action in
            self.viewModel.didSelectPopItemAt(platform: "pc")
            
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))
        
        //uncomment for iPad Support
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}

// MARK: -  SubscribeViewModel
extension HomeViewController {
    
    private func subscribeViewModel() {
        viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
}

// MARK: -  UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(indexPath: indexPath)
    }
    
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

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.numberOfItems == 0 {
            tableView.setEmptyView(message: "No Data!", image: UIImage(systemName: "exclamationmark.triangle.fill")!)
        } else {
            tableView.restoreTableView()
        }
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: viewModel.cellForItemAt(indexPath: indexPath))
        return cell
    }
}
