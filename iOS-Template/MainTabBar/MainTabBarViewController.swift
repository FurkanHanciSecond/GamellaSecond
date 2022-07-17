//
//  MainTabBarViewController.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import UIKit
import UIComponents

final class MainTabBarController: UITabBarController {
    
    var viewModel: MainTabBarViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
}


// MARK: - Configure
extension MainTabBarController {
    private func setTabBar() {
        configureTabBar()
        setTabs()
    }
    
    private func configureTabBar() {
        tabBar.tintColor = AppConstants.Style.Color.black
        tabBar.unselectedItemTintColor = AppConstants.Style.Color.orange
    }
    
    private func setTabs() {
        viewControllers = [
            homeVC(),
            sortVC(),
            moreVC(),
            settingsVC()
        ]
    }
    
    private func homeVC() -> UINavigationController {
        let router = HomeRouter()
        let viewModel = HomeViewModel(router: router)
        let homeViewController = HomeViewController(viewModel: viewModel)
        router.viewController = homeViewController
        let homeTabBarItem = UITabBarItem(title: AppConstants.Texts.Bar.home, image: AppConstants.Style.Image.homeTabBar, tag: 0)
        homeViewController.tabBarItem = homeTabBarItem
        let navigationController = UINavigationController(rootViewController: homeViewController)
        return navigationController
    }
    
    private func sortVC() -> UINavigationController {
        let router = SortRouter()
        let viewModel = SortViewModel(router: router)
        let sortViewController = SortViewController(viewModel: viewModel)
        router.viewController = sortViewController
        let sortTabBarItem = UITabBarItem(title: AppConstants.Texts.Bar.sort, image: AppConstants.Style.Image.sortTabBar, tag: 1)
        sortViewController.tabBarItem = sortTabBarItem
        return UINavigationController(rootViewController: sortViewController)
    }
    
    
    private func moreVC() -> UINavigationController {
        let moreViewController = MoreViewController(viewModel: MoreViewModel.init(router: MoreRouter.init()))
        let moreTabBarItem = UITabBarItem(title: AppConstants.Texts.Bar.more, image: AppConstants.Style.Image.moreTabBar, tag: 2)
        moreViewController.tabBarItem = moreTabBarItem
        return UINavigationController(rootViewController: moreViewController)
    }
    
    private func settingsVC() -> UINavigationController {
        let settingsViewController = SettingsViewController(viewModel: SettingsViewModel.init(router: SettingsRouter.init()))
        let settingsTabBarItem = UITabBarItem(title: AppConstants.Texts.Bar.settings, image: AppConstants.Style.Image.settingsTabBar, tag: 3)
        settingsViewController.tabBarItem = settingsTabBarItem
        return UINavigationController(rootViewController: settingsViewController)
    }
    
    
}
