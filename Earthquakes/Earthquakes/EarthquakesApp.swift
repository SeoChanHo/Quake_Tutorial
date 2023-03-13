//
//  EarthquakesApp.swift
//  Earthquakes
//
//  Created by 서찬호 on 2023/03/13.
//

import SwiftUI

@main
struct EarthquakesApp: App {
    @StateObject var quakesProvider = QuakesProvider()
    var body: some Scene {
        WindowGroup {
            Quakes()
                .environmentObject(quakesProvider)
        }
    }
}
