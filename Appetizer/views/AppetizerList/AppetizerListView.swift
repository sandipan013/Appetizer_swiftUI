//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Sandipan Biswas on 17/09/23.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var appetizerViewModel = AppetizerViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(appetizerViewModel.appetizerList, id: \.id) { appetizer in
                    AppetizerListViewCell(appetizer: appetizer)
                }
                .navigationTitle("Appetizers")
            }
            .onAppear {
                appetizerViewModel.getAppetizers()
            }
            
            if appetizerViewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $appetizerViewModel.alertItem) { alertItem in
            Alert(title: Text(alertItem.title),
                  message: Text(alertItem.message),
                  dismissButton: alertItem.dismissButton)
        }
    }
    
    
}


struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
