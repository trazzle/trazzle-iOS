//
//  CountryListView.swift
//  Trazzle
//
//  Created by joomin on 3/27/24.
//

import SwiftUI

let countryURL = "https://trazzle.p-e.kr/api/countries"

struct CountryListView: View {
    
    @State private var results = [Country]()
    
    init() {
        UITableView.appearance().backgroundColor = .white
        UICollectionView.appearance().backgroundColor = .white
    }
    
    var body: some View {
        @State var isTapped = false
        @State var searchText = ""
        var count = results.count
        
        NavigationView {
            VStack(spacing: 0) {
                
                HStack {
                    BackButton()
                    Spacer()
                    Text("여행 기록")
                    Spacer()
                }
                .padding()
                .frame(height: 48)
                

                VStack() {
                    SearchBar(searchText: $searchText, placeHolder: "국가명으로 검색")
                        .padding()
                    
                    ScrollView(.horizontal) {
                        HStack() {
                            CategoryView(countryName: "아시아")
                            CategoryView(countryName: "유럽")
                            CategoryView(countryName: "북아메리카")
                            CategoryView(countryName: "남아메리카")
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    Text("총 \(count)개국")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .font(Font.system(size: 12))
                        .foregroundColor(.g300)
                        
                }.background(Color.g50)
                
                
                if #available(iOS 16.0, *) {
                    List(results, id: \.name) { country in
                        Text(country.name)
                            .background(
                                NavigationLink("",destination: CityListView(country: country)
                            ).opacity(0)
                        
                        )
                    }.scrollContentBackground(.hidden)
                        .preferredColorScheme(.light)
                        .background(Color.g50)
                } else {
                    List(results, id: \.name) { country in
                        NavigationLink(destination: CityListView(country: country)) {
                            Text(country.name)
                                .listRowBackground(Color.white)
                        }
                    }
                    .preferredColorScheme(.light)
                    .background(Color.g50)
                }
                
            }
            /*
            .navigationTitle("여행 기록")
            .background(Color.white)
            .foregroundColor(.black)
             */
        }.task {
            await loadData()
        }
        
    }
    
    func loadData() async {
        guard let url = URL(string: countryURL) else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // --- here
            let decoded: [Country] = try JSONDecoder().decode([Country].self, from: data)
            results = decoded
        } catch {
            print(error)  // <--- important
        }
    }
    
}

struct BackButton: View {
    var body: some View {
        Button(action: {
            // 뒤로가기 버튼 기능 구현
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.black)
        }
    }
}

#Preview {
    CountryListView()
}
