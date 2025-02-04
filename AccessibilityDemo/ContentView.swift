//
//  ContentView.swift
//  AccessibilityDemo
//
//  Created by Vasiliki on 23/4/24.
//

import SwiftUI

struct CountryListView: View {
    var model: CountryListViewModel
    @State private var sliderValue: Double = 0
    
    var body: some View {
        Text(model.title)
            .accessibilityHeading(.h3)
            .accessibilityAddTraits(.isHeader)
            .accessibilityIdentifier("Countries_Title_")
            .fontWeight(.heavy)
            .padding()
        Divider()
        ScrollView {
            countriesList
            Text("Rating:")
                .accessibilityIdentifier("Slider_Title_")
            sliderView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    var sliderView: some View {
        Slider(value: $sliderValue, in: 0...20)
            .accessibilityValue("\(Int(sliderValue))")
            .accessibilityAdjustableAction { direction in
                switch direction {
                case .increment:
                    sliderValue += 1
                case .decrement:
                    sliderValue -= 1
                @unknown default:
                    break
                }
            }
        Text("Your rating is %.0f \(sliderValue, specifier: "%.1f")")
            .accessibilityIdentifier("Slider_Value")
    }
    
    var countriesList: some View {
        ForEach(model.countries) { country in
            VStack {
                HStack {
                    Text(country.name)
                        .padding(.leading, 12)
                        .foregroundStyle(.cyan)
                        .padding(.horizontal, 22)
                    Button(action: {
                        print(country.name)
                    }, label: {
                        Image(systemName: "star")
                    })
                    .accessibilityIdentifier("Country \(country.name)")
                    .accessibilityLabel("press here if \(country.name) is your favorite country")
                }
                Divider()
            }
        }
        
    }
}

#Preview {
    CountryListView(model: CountryListViewModel())
}
