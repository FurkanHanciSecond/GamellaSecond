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
            //TODO: Complete it
        }
        
        public enum Bar {
            //TODO: Complete it
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
        }
    }
}
