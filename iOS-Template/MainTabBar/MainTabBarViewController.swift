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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationWithIndex(0)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        for (k,v) in (tabBar.items?.enumerated())! {
            if v == item {
                animationWithIndex(k)
            }
        }
    }
}


// MARK: - Configure
extension MainTabBarController {
    private func setTabBar() {
        configureTabBar()
        setTabs()
    }
    
    private func configureTabBar() {
        tabBar.tintColor = AppConstants.Style.Color.gameTurquoise
        tabBar.unselectedItemTintColor = AppConstants.Style.Color.orange
        delegate = self
    }
    
    private func setTabs() {
        viewControllers = [
            homeVC(),
            sortVC(),
            moreVC(),
            settingsVC()
        ]
    }
    
   private func animationWithIndex(_ index:Int){
        
        var tabbarbuttonArray: [Any] = [Any]()
        
        for tabBarBtn in self.tabBar.subviews {
            if tabBarBtn.isKind(of: NSClassFromString("UITabBarButton")!) {
                tabbarbuttonArray.append(tabBarBtn)
            }
        }
        
        // define animation
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        pulse.duration = 0.08
        pulse.repeatCount = 1
        pulse.autoreverses = false
        pulse.fillMode = CAMediaTimingFillMode.forwards
        pulse.isRemovedOnCompletion = false
        pulse.fromValue = 0.7
        pulse.toValue = 1.1
        
        // add animation
        let tabBarLayer = (tabbarbuttonArray[index] as AnyObject).layer
        tabBarLayer?.add(pulse, forKey: "transform.scale")
        
        // remove other animation
        for i in 0...3{
            if i != index{
                let otherTabBarLayer = (tabbarbuttonArray[i] as AnyObject).layer
                otherTabBarLayer?.removeAllAnimations()
            }
        }
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
        let router = MoreRouter()
        let viewModel = MoreViewModel(router: router)
        let moreViewController = MoreViewController(viewModel: viewModel)
        router.viewController = moreViewController
        let moreTabBarItem = UITabBarItem(title: AppConstants.Texts.Bar.more, image: AppConstants.Style.Image.moreTabBar, tag: 2)
        moreViewController.tabBarItem = moreTabBarItem
        return UINavigationController(rootViewController: moreViewController)
    }
    
    private func settingsVC() -> UINavigationController {
        let router = SettingsRouter()
        let viewModel = SettingsViewModel(router: router)
        let settingsViewController = SettingsViewController(viewModel: viewModel)
        router.viewController = settingsViewController
        let settingsTabBarItem = UITabBarItem(title: AppConstants.Texts.Bar.settings, image: AppConstants.Style.Image.settingsTabBar, tag: 3)
        settingsViewController.tabBarItem = settingsTabBarItem
        return UINavigationController(rootViewController: settingsViewController)
    }
    
    
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
            return false
        }
        
        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.2, options: [.transitionCrossDissolve], completion: nil)
        }
        
        return true
    }
}
