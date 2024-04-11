//
//  ContentView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/24.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        // MARK: TabBar
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.white
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().barTintColor = .white
    }
    
    var body: some View {
        TabView {
            NavigationStack {
                HomeView(titleText: .constant(TrazzleConstants.launchTitleText))
            }
            .tabItem {
                Image("globe")
                    .renderingMode(.template)
                Text("홈")
            }
            
            NavigationStack {
                TravelRecordCollectionView()
            }
            .tabItem {
                Image("book")
                    .renderingMode(.template)
                Text("지도집")
            }
            .toolbar(.visible, for: .tabBar)
        }
        .tint(.p500)
    }
}

#Preview {
    ContentView()
}
