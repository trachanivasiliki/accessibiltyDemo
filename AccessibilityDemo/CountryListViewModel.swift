//
//  CountryListViewModel.swift
//  AccessibilityDemo
//
//  Created by Vasiliki on 23/4/24.
//

import Foundation

struct Country: Identifiable {
    let id = UUID()
    let name: String
}

protocol CountryListProtocol {
    var title: String { get }
    var countries: [Country] { get }
}

class CountryListViewModel: CountryListProtocol {
    var title: String = "Countries"
    var countries: [Country] = [Country(name: "Greece"),
                                Country(name: "Italy"),
                                Country(name: "Spain"),
                                Country(name: "Porugal"),
                                Country(name: "UK"),
                                Country(name: "Croatia")]
}
