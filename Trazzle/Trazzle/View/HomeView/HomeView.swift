//
//  HomeView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/25.
//

import SwiftUI
import CodableGeoJSON

struct HomeView: View {
    
    @Binding var titleText: String
    @State var isShowingCountryStatisticsView = false
    
    var homeVM = HomeViewModel.shared
    @State var navTitle: String = "MY Travel"
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                // 세계지도
                ScrollView([.horizontal],
                           showsIndicators: false) {
                    Canvas(rendersAsynchronously: true) { context, size in
                        let drawer = GeoJSONMapDrawer(featureCollection: homeVM.loadGeojson(),
                                                      colorDict: [
                                                        "RU": .mainGreen,
                                                      ])
                        drawer.drawMap(borderColor: .homeBgColor,
                                       borderWidth: 1.6,
                                       size: size,
                                       context: context)
                    }
                    // from a quick google, 1.65 is apparently best for a mercator map
                    .aspectRatio(1.65, contentMode: .fill)
                }.ignoresSafeArea()
                VStack {
                    HomeNavView(titleText: $navTitle)
                        .frame(height: 52, alignment: .top)
                    Spacer()
                }
                // 여행기록 추가버튼
                NavigationLink(value: "Login") {
                    ZStack(alignment: .bottomTrailing) {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(.all)
                            .background(Color.mainGreen)
                            .frame(width: 56, height: 56)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 4, x: 0 , y: 4)
                    }
                    .padding(.trailing, 16)
                    .padding(.bottom, 40)
                }
                .navigationDestination(for: String.self) { view in
                    if LoginManager.shared.isLoggedIn {
                        CountryListView()
                    } else {
                        LoginView()
                            .navigationBarBackButtonHidden(true)
                            .toolbar(.hidden, for: .tabBar)
                    }
                }
            }
            .background(Color.homeBgColor)
            
            // MARK: - NavigationBar
            //            .navigationBarTitleDisplayMode(.inline)
            //            .navigationBarBackButtonHidden(true)
            //            .toolbarBackground(.hidden, for: .navigationBar)
            //            .toolbarBackground(Color.white, for: .navigationBar)
            //            .toolbar {
            //                ToolbarItem(placement: .navigationBarLeading) {
            //                    Text("MY Travel")
            //                        .font(.system(size: 16, weight: .semibold))
            //                        .foregroundStyle(Color.highlightGreen)
            //                        .padding(.leading, 16)
            //                        .padding([.top, .bottom], 19)
            //                }
            //                ToolbarItem(placement: .navigationBarTrailing)  {
            //                    HStack {
            //                        // 공유 버튼
            //                        Button(action: {
            //                            print("export button action")
            //                        },label: {
            //                            Image("export")
            //                                .resizable()
            //                                .scaledToFit()
            //                                .frame(width: 24, height: 48)
            //                        })
            //                        .frame(width: 48, height: 48)
            //                        // 통계 버튼
            //                        Button(action: {
            //                            self.isShowingCountryStatisticsView.toggle()
            //                            print("isShowingCS: \(isShowingCountryStatisticsView)")
            //
            //                        },label: {
            //                            Image("statistics")
            //                                .resizable()
            //                                .scaledToFit()
            //                                .frame(width: 24, height: 24)
            //                        })
            //                        .frame(width: 48, height: 48)
            //                    }
            //                }
            //            }
        }
        // MARK: - 통계뷰
//        .safeAreaInset(edge: .top) {
//            VStack {
//                Spacer().frame(height: 52 + (TrazzleApplication.getNotchHeight() ?? 0))
//                CountryStatisticView()
//                    .frame(height: 109)
//                    .hide(if: !isShowingCountryStatisticsView)
//                    .background(Color.white60)
//            }
//            
//        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(titleText: .constant("MY Travel"))
    }
}

