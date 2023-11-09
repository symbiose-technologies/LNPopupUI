//
//  TabDemoView.swift
//  LNPopupUIExample
//
//  Created by Leo Natan (Wix) on 9/5/20.
//
#if canImport(UIKit)
import SwiftUI
import LoremIpsum
import LNPopupUI

struct InnerView : View {
	let tabIdx: Int?
	let onDismiss: () -> Void
	
	let presentBarHandler: (() -> Void)?
	let hideBarHandler: (() -> Void)?
	
	var body: some View {
		ZStack(alignment: .topTrailing) {
			SafeAreaDemoView(colorSeed: tabIdx != nil ? "tab_\(tabIdx!)" : "nil", presentBarHandler: presentBarHandler, hideBarHandler: hideBarHandler)
			Button("Gallery") {
				onDismiss()
			}.padding()
		}
	}
}

struct TabDemoView : View {
	@State private var isBarPresented: Bool = true
	private let onDismiss: () -> Void
	let demoContent: DemoContent
	
	init(demoContent: DemoContent, onDismiss: @escaping () -> Void) {
		self.onDismiss = onDismiss
		self.demoContent = demoContent
	}
	
	func presentBarHandler() {
		isBarPresented = true
	}
	
	func hideBarHandler() {
		isBarPresented = false
	}
	
	var body: some View {
		TabView{
			InnerView(tabIdx:0, onDismiss: onDismiss, presentBarHandler: presentBarHandler, hideBarHandler: hideBarHandler)
				.tabItem {
					Image(systemName: "1.square")
					Text("Tab")
				}
			InnerView(tabIdx:1, onDismiss: onDismiss, presentBarHandler: presentBarHandler, hideBarHandler: hideBarHandler)
				.tabItem {
					Image(systemName: "2.square")
					Text("Tab")
				}
			InnerView(tabIdx:2, onDismiss: onDismiss, presentBarHandler: presentBarHandler, hideBarHandler: hideBarHandler)
				.tabItem {
					Image(systemName: "3.square")
					Text("Tab")
				}
			InnerView(tabIdx:3, onDismiss: onDismiss, presentBarHandler: presentBarHandler, hideBarHandler: hideBarHandler)
				.tabItem {
					Image(systemName: "4.square")
					Text("Tab")
				}
			InnerView(tabIdx:4, onDismiss: onDismiss, presentBarHandler: presentBarHandler, hideBarHandler: hideBarHandler)
				.tabItem {
					Image(systemName: "xmark.square")
					Text("Hide Bar")
				}
				.toolbar(.hidden, for: .tabBar)
		}
		.popupDemo(demoContent: demoContent, isBarPresented: $isBarPresented, includeContextMenu: UserDefaults.standard.bool(forKey: PopupSettingsContextMenuEnabled))
	}
}

struct TabDemoView_Previews: PreviewProvider {
	static var previews: some View {
		TabDemoView(demoContent: DemoContent(), onDismiss: {})
	}
}
#endif
