//
//  ImageLoader.swift
//  Appetizer
//
//  Created by Sandipan Biswas on 20/09/23.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(urlString: String) {
        NetworkManager.shared.downloadImages(urlString: urlString) { uiImage in
            guard let uiImage = uiImage else {return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(urlString: urlString)
            }
    }
}
