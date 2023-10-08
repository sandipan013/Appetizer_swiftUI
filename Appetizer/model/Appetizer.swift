//
//  Appetizer.swift
//  Appetizer
//
//  Created by Sandipan Biswas on 18/09/23.
//

import Foundation

struct Appetizer: Codable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    let price: Double
    let protein: Int
    let carbs: Int
    let calories: Int
}

struct AppetizerResponse: Codable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 1, name: "Test", description: "Testing appetizer", imageURL: "", price: 9.99, protein: 10, carbs: 20, calories: 100)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
