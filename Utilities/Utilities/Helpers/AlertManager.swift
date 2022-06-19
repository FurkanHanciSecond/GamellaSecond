//
//  AlertManager.swift
//  Utilities
//
//  Created by Furkan Hanci on 5/22/22.
//

import UIKit
//import UIComponents

public class AlertManager {
   public static func showAlert(
        title: String,
        message: String,
        alertAction: VoidClosure? = nil,
        viewController: UIViewController?) {
            
            DispatchQueue.main.async {
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "AppConstants.Texts.Error.ok", style: .default) { action in
                    alertAction?()
                }
                alertController.addAction(action)
                viewController?.present(alertController , animated: true, completion: nil)
            }
        }
}
