//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 박서인 on 10/5/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
