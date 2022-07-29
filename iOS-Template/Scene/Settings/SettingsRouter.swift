//
//  SettingsRouter.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

final class SettingsRouter: Router , SettingsRouter.Routes {
    typealias Routes = ShareSheetRoute & PresentMailRoute & PaywallRoute & AlertView
}
