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
import PopMenu
final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let popMenuManager = PopMenuManager.default
    
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
        view.backgroundColor = viewModel.backgroundColor
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
        tableView.backgroundView = nil
    }
}

// MARK: - Configure
extension HomeViewController {
    
    private func configureContents() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        configurePopMenu()
        addBarButton()
    }
    
    private func addBarButton() {
        let navBarButton = UIBarButtonItem(image: AppConstants.Style.Image.grid, style: .plain, target: self, action: #selector(gridButtonHandle(_:)))
        navBarButton.tintColor = AppConstants.Style.Color.labelColor
        self.navigationItem.rightBarButtonItem = navBarButton
    }
    
    private func configurePopMenu() {
        let action1 = PopMenuDefaultAction(title: "Steam", image: UIImage(systemName: "network"))
        let action2 = PopMenuDefaultAction(title: "Epic Games", image: UIImage(systemName: "e.square"))
        let action3 = PopMenuDefaultAction(title: "Ubisoft", image: UIImage(systemName: "tornado"))
        let action4 = PopMenuDefaultAction(title: "Itchio", image: UIImage(systemName: "i.square"))
        let action5 = PopMenuDefaultAction(title: "PS4", image: UIImage(systemName: "logo.playstation"))
        let action6 = PopMenuDefaultAction(title: "PS5", image: UIImage(systemName: "logo.playstation"))
        let action7 = PopMenuDefaultAction(title: "XboxOne", image: UIImage(systemName: "logo.xbox"))
        let action8 = PopMenuDefaultAction(title: "Xbox Series X/S", image: UIImage(systemName: "logo.xbox"))
        let action9 = PopMenuDefaultAction(title: "Nintendo Switch", image: UIImage(systemName: "gamecontroller"))
        let action10 = PopMenuDefaultAction(title: "Battlenet", image: UIImage(systemName: "network"))
        let action11 = PopMenuDefaultAction(title: "Origin", image: UIImage(systemName: "flame.circle"))
        let action12 = PopMenuDefaultAction(title: "Xbox 360", image: UIImage(systemName: "logo.xbox"))
        
        popMenuManager.actions = [
            action1,
            action2,
            action3,
            action4,
            action5,
            action6,
            action7,
            action8,
            action9,
            action10,
            action11,
            action12,
        ]
        
        popMenuManager.popMenuDelegate = self
        popMenuManager.popMenuShouldEnableHaptics = true
        popMenuManager.popMenuAppearance.popMenuScrollIndicatorHidden = true
        popMenuManager.popMenuAppearance.popMenuCornerRadius = 20
        popMenuManager.popMenuAppearance.popMenuColor.backgroundColor = .gradient(fill: AppConstants.Style.Color.indigo! , AppConstants.Style.Color.orange!)
    }
}

// MARK: - Actions
extension HomeViewController {
    @objc private func gridButtonHandle(_ sender: UIBarButtonItem) {
        popMenuManager.present()
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

// MARK: - PopMenuDelegate
extension HomeViewController: PopMenuViewControllerDelegate {
    func popMenuDidSelectItem(_ popMenuViewController: PopMenuViewController, at index: Int) {
        switch index {
        case 0:
            viewModel.didSelectPopItemAt(platform: "steam")
            
        case 1:
            viewModel.didSelectPopItemAt(platform: "epic-games-store")
            
        case 2:
            viewModel.didSelectPopItemAt(platform: "ubisoft")
            
        case 3:
            viewModel.didSelectPopItemAt(platform: "itchio")
            
        case 4:
            viewModel.didSelectPopItemAt(platform: "ps4")
            
        case 5:
            viewModel.didSelectPopItemAt(platform: "ps5")
            
        case 6:
            viewModel.didSelectPopItemAt(platform: "xbox-one")
            
        case 7:
            viewModel.didSelectPopItemAt(platform: "xbox-series-xs")
            
        case 8:
            viewModel.didSelectPopItemAt(platform: "switch")
            
        case 9:
            viewModel.didSelectPopItemAt(platform: "battlenet")
            
        case 10:
            viewModel.didSelectPopItemAt(platform: "origin")
            
        case 11:
            viewModel.didSelectPopItemAt(platform: "xbox-360")
            
        default:
            break;
        }
        
    }
}
