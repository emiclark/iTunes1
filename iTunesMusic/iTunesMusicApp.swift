//
//  iTunesMusicApp.swift
//  iTunesMusic
//
//  Created by Clark, Emiko [CWM] on 3/18/23.
//

import SwiftUI

@main
struct iTunesMusicApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreenView(viewModel: HomeScreenViewModel(items: []))
        }
    }
}
