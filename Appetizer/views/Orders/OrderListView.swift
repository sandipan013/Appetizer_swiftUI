//
//  OrderView.swift
//  Appetizer
//
//  Created by Sandipan Biswas on 17/09/23.
//

import SwiftUI

struct OrderListView: View {
    
    @StateObject var ordersViewModel = OrderViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(ordersViewModel.orderList, id: \.id) { appetizer in
                    AppetizerListViewCell(appetizer: appetizer)
                }
                .listStyle(.plain)
                
                Spacer()
                
                Button {
                    print("Learn more btn clicked")
                } label: {
                    Text ("Order Placed")
                        .font(.system(size: 24, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding(.bottom, 8)
            }
            .navigationTitle("Order Items")
        }
        .onAppear {
            ordersViewModel.loadItems()
        }
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
