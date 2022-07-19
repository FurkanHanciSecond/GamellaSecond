//
//  AppConstants.swift
//  Utilities
//
//  Created by Furkan Hanci on 5/21/22.
//

import Foundation
import UIKit

public struct AppConstants {
    static let appName = "Gamella"
    
    public struct OnBoard {
        public enum OnboardDescription {
            public static let description1 = "See all free giveaway games!"
            public static let description2 = "Get more detail about the Game!"
            public static let description3 = "Sort games by date, value and popularity"
            public static let description4 = "You can also see free games on all platfroms and all of features"
        }
    }
    
    public struct Texts {
        public static let welcomeText = "Hi, game lover! What is your name?"
        public static let enterName = "Enter your name here..."
        
        public enum Button {
            public  static let onboardButtonText = "Lets get start 🚀"
            public static let next = "Next"
        }
        
        public enum Error {
            public static let ok = "Ok"
        }
        
        public enum Bar {
            //TODO: Complete it
            public static let home = "Home"
            public static let sort = "Sort"
            public static let more = "More"
            public static let settings = "Settings"
        }
    }
    
    public struct Style {
        public enum Color {
            public static let indigo = UIColor(named: "GameIndigo")
            public static let white = UIColor.white
            public static let black = UIColor.black
            public static let gray = UIColor.gray
            public static let systemBackground = UIColor.systemBackground
            public static let labelColor = UIColor.label
            public static let orange = UIColor(named: "GameOrange")
            public static let lightOrange = UIColor(named: "GameLightOrange")
            public  static let lightPurple = UIColor(named: "GameLightPurple")
            public static let clear = UIColor.clear
            public static let darkWhite = UIColor(named: "DarkWhite")
        }
        
        public enum Image {
            public static let upload = UIImage(systemName: "square.and.arrow.up")
            public static let grid = UIImage(systemName: "square.grid.3x3")
            public static let homeTabBar = UIImage(systemName: "house.fill")
            public static let sortTabBar = UIImage(systemName: "arrow.up.arrow.down")
            public static let moreTabBar = UIImage(systemName: "ellipsis.circle")
            public static let settingsTabBar = UIImage(systemName: "gear")
            public static let sortIcon = UIImage(systemName: "arrow.up.arrow.down.square.fill")
        }
    }
}
