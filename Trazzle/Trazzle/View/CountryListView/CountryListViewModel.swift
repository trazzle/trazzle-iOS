//
//  CountryListViewModel.swift
//  Trazzle
//
//  Created by joomin on 5/20/24.
//

import Combine
import SwiftUI

class CountryListViewModel: ObservableObject {
    
    private var cancellable = Set<AnyCancellable>()
    
    func searchCountries(name: String, code: String, continent: String, cursor: Int) {
        NetworkService.shared.searchCountries(name: name, code: code, continent: continent, cursor: cursor)
            .sink(receiveCompletion: { error in
                TZLoadingView.shared.hide()
                print(error)
            }, receiveValue: { data in
                TZLoadingView.shared.hide()
                // 🧩 성공
                
                print("searchCountries success: \(data)")
            })
            .store(in: &cancellable)
    }
}
