//
//  LNPopupUIExampleApp.swift
//  LNPopupUIExample
//
//  Created by Leo Natan on 10/11/22.
//

import SwiftUI

@main
struct LNPopupUIExample: App {
	var body: some Scene {
		WindowGroup {
            #if os(iOS)
			SceneSelection()
            #else
            ZStack {
                Color.blue
            }
            #endif
        }
	}
}
