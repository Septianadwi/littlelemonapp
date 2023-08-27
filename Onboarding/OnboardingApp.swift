//
//  OnboardingApp.swift
//  Onboarding
//
//  Created by Mac Pro on 13/08/23.
//

import SwiftUI

@main
struct OnboardingApp: App {
    var body: some Scene {
        WindowGroup {
            Onboarding()
        }
    }
    init() {
            UserDefaults.standard.set(true, forKey: "com.apple.CoreData.SQLDebug")
        }
    }
