//
//  BaseViewController.swift
//  NYT
//
//  Created by Ercan Garip on 25.11.2021.
//
import UIKit
import UIComponents
import MobilliumBuilders
import TinyConstraints

class BaseViewController<V: BaseViewModelProtocol>: UIViewController {
    
    private var animatedPopController = true
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        subscribeLoading()
    }
    
    private func configureContents() {
        self.tabBarController?.tabBar.isTranslucent = true
        let backBarButtonItem = UIBarButtonItem(title: "Test", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationItem.rightBarButtonItem = backBarButtonItem
        view.backgroundColor = .lightGray
    }
    
    @objc
    func tryAgainButtonTapped() {
        viewModel.tryAgainButtonTapped()
    }
    
    @objc
    private func popController() {
        navigationController?.popViewController(animated: animatedPopController)
    }
    
#if DEBUG || DEVELOP
    deinit {
        debugPrint("deinit \(self)")
    }
#endif
}

// MARK: - Loading
extension BaseViewController {
    
    private func subscribeLoading() {
        viewModel.showLoading = {
            let window = UIApplication.shared.windows.first
            window?.startActivityIndicator()
        }
        viewModel.hideLoading = {
            let window = UIApplication.shared.windows.first
            window?.stopActivityIndicator()
        }
    }
}
