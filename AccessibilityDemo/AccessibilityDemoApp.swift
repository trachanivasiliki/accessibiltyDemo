//
//  AccessibilityDemoApp.swift
//  AccessibilityDemo
//
//  Created by Vasiliki on 23/4/24.
//

import SwiftUI

@main
struct AccessibilityDemoApp: App {
    var body: some Scene {
        WindowGroup {
            CountryListView(model: CountryListViewModel())
        }
    }
}
