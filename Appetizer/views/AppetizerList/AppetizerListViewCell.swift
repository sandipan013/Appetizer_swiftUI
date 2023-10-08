//
//  AppetizerListViewCell.swift
//  Appetizer
//
//  Created by Sandipan Biswas on 18/09/23.
//

import SwiftUI

struct AppetizerListViewCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack (alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(String(format: "%.2f", appetizer.price))
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListViewCell(appetizer: MockData.sampleAppetizer)
    }
}
