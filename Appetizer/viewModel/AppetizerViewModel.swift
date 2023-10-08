//
//  AppetizerViewModel.swift
//  Appetizer
//
//  Created by Sandipan Biswas on 18/09/23.
//

import Foundation

class AppetizerViewModel: ObservableObject {
    
    @Published var appetizerList: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    func getAppetizers() {
        self.isLoading = true
        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async {
                
                self.isLoading = false
                
                switch result {
                    case .success(let appetizers):
                        self.appetizerList = appetizers
                    case .failure(let error):
                        switch error {
                            case .badURL:
                                self.alertItem = AlertContent.invalidData
                            case .invalidResource:
                                self.alertItem = AlertContent.invalidResponse
                            case .notAbleToComplete:
                                self.alertItem = AlertContent.unableToComplete
                            case .invalidData:
                                self.alertItem = AlertContent.invalidData
                        }
                }
            }
        }
    }
    
}
