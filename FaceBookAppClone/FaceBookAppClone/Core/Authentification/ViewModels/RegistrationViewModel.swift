//
//  RegistrationViewModel.swift
//  FaceBookAppClone
//
//  Created by Macbook on 7/3/25.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var familyName: String = ""
    
    @Published var gender: String = ""
    @Published var genderChoices: [String] = ["Female", "Male", "More options"]
    @Published var age: String = ""
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    
}
