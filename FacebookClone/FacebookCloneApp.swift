//
//  FacebookCloneApp.swift
//  FacebookClone
//
//  Created by Maliks on 01/04/2024.
//

import SwiftUI

@main
struct FacebookCloneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

extension NSTextField  {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set {}
    }
}
