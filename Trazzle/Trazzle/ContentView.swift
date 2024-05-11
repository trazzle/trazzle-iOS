//
//  ContentView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var isPresented = false
    @State private var selectedTab: Int = 0
    
    init() {
        // MARK: TabBar
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.white
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().barTintColor = .white
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                HomeView(titleText: .constant(TrazzleConstants.launchTitleText))
            }
            .tabItem {
                Image("globe")
                    .renderingMode(.template)
                Text("홈")
            }
            .tag(0)
            
            NavigationStack {
                TravelRecordCollectionView()
            }
            .tabItem {
                Image("book")
                    .renderingMode(.template)
                Text("지도집")
            }
            .tag(1)
            .toolbar(.visible, for: .tabBar)
        }
        .tint(.p500)
        .onChange(of: selectedTab) {
            if $0 == 1 {
                if !LoginManager.shared.isLoggedIn {
                    self.selectedTab = 0
                }
            }
            else if $0 == 0, !LoginManager.shared.isLoggedIn {
                isPresented.toggle()
            }
            else {
                self.selectedTab = $0
            }
           
        }
        .fullScreenCover(
            isPresented: $isPresented,
            content: {
                LoginView(isFullScreenOver: $isPresented)
            })
        
    }
}

#Preview {
    ContentView()
}
