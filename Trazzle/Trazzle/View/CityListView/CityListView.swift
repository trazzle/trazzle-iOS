//
//  CityListView.swift
//  Trazzle
//
//  Created by joomin on 3/29/24.
//

import SwiftUI

struct CityListView: View {
    @State private var results = [City]()
    let cityURL = "https://trazzle.p-e.kr/api/cities?countryCode="
    let country: Country
    
    let cities = ["New York", "London", "Paris", "Tokyo", "Sydney", "Rome", "Berlin", "Moscow", "Seoul", "Beijing",
                  "New York", "London", "Paris", "Tokyo", "Sydney", "Rome", "Berlin", "Moscow", "Seoul", "Beijing"]
        
        init(country: Country) {
            self.country = country
        }
    
    var body: some View {
        ZStack {
            
            VStack {
                
                List(cities, id: \.self) { city in
                                Text(city)
                            }
                
                MainButton(buttonText: "다음")
                    .frame(maxWidth: .infinity)
                
            }.navigationTitle(country.name)
            
        }
    }
    
    
    func loadData() async {
        guard let url = URL(string: cityURL + country.code) else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // --- here
            let decoded: [City] = try JSONDecoder().decode([City].self, from: data)
            results = decoded
        } catch {
            print(error)  // <--- important
        }
    }
    
    
}




//#Preview {
//    let country = Country(name: "Korea", code: "KR")
//    CityListView(country: country)
//}
