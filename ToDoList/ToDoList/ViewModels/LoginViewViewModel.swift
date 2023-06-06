//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Drew on 5/22/23.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMSG = ""
    
    init(){}
    
    func login(){
        guard validate() else {
            return
        }
        print("attempting login")
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMSG = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMSG = "Please fill in all fields."
                  return false
              }
        
        guard email.contains("@") && email.contains(".")
               else {
            
            errorMSG = "Please enter a valid email."
                  return false
              }
        print("valid email and password")
        return true
    }
    
}
