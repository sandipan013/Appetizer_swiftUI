//
//  NetworkManager.swift
//  Appetizer
//
//  Created by Sandipan Biswas on 18/09/23.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseUrl + "appetizers"
    
    private init() {
        
    }
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.notAbleToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResource))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decoderResponse = try decoder.decode(AppetizerResponse.self, from: data)
                
                completed(.success(decoderResponse.request))
                
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
        
    }
    
    
    func downloadImages(urlString: String, completed: @escaping (UIImage?) -> Void) {
        guard let imageUrl = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: imageUrl)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            completed(image)
            
        }
        
        task.resume()
    }
}

