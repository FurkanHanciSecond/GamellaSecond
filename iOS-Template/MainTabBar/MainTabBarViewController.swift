//
//  MainTabBarViewController.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import UIKit
import Utilities
final class MainTabBarController: UITabBarController {
    
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
        tabBar.unselectedItemTintColor = AppConstants.Style.Color.indigo
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
        let homeViewController = HomeViewController(viewModel: HomeViewModel.init(router: HomeRouter.init()))
        let homeTabBarItem = UITabBarItem(title: AppConstants.Texts.Bar.home, image: AppConstants.Style.Image.homeTabBar, tag: 0)
        homeViewController.tabBarItem = homeTabBarItem
        return UINavigationController(rootViewController: homeViewController)
    }
    
    private func sortVC() -> UINavigationController {
        let sortViewController = SortViewController(viewModel: SortViewModel.init(router: SortRouter.init()))
        let sortTabBarItem = UITabBarItem(title: AppConstants.Texts.Bar.sort, image: AppConstants.Style.Image.sortTabBar, tag: 0)
        sortViewController.tabBarItem = sortTabBarItem
        return UINavigationController(rootViewController: sortViewController)
    }
    
    
    private func moreVC() -> UINavigationController {
        let moreViewController = MoreViewController(viewModel: MoreViewModel.init(router: MoreRouter.init()))
        let moreTabBarItem = UITabBarItem(title: AppConstants.Texts.Bar.more, image: AppConstants.Style.Image.moreTabBar, tag: 0)
        moreViewController.tabBarItem = moreTabBarItem
        return UINavigationController(rootViewController: moreViewController)
    }
    
    private func settingsVC() -> UINavigationController {
        let settingsViewController = SettingsViewController(viewModel: SettingsViewModel.init(router: SettingsRouter.init()))
        let settingsTabBarItem = UITabBarItem(title: AppConstants.Texts.Bar.settings, image: AppConstants.Style.Image.settingsTabBar, tag: 0)
        settingsViewController.tabBarItem = settingsTabBarItem
        return UINavigationController(rootViewController: settingsViewController)
    }
    
    
}
