//
//  Alert.swift
//  Appetizer
//
//  Created by Sandipan Biswas on 19/09/23.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContent {
    static let invalidData = AlertItem(title: "Invalid Data",
                                              message: "Something went wrong with the server please try after some time.",
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidResponse = AlertItem(title: "Invalid Response",
                                              message: "Something went wrong with the server please try after some time.",
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidUrl = AlertItem(title: "Invalid Url",
                                              message: "Something went wrong with the server please try after some time.",
                                              dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: "Unable to complete",
                                              message: "Something went wrong with the server please try after some time.",
                                              dismissButton: .default(Text("Ok")))
}
