//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Drew on 5/22/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel : ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password1 = ""
    @Published var password2 = ""
    @Published var errorMSG = ""
    
    init(){}
    
    func register(){
        guard validate() else {
            return
        }
        
        print("Attempting to register a new user")
        Auth.auth().createUser(withEmail: email, password: password1){[weak self] result, error in
            guard let userId = result?.user.uid else {
                print("broke something")
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("Users")
            .document(id)
            .setData(newUser.asDictionary())
        print("Added new user to FireStore.")
    }
    
    private func validate() -> Bool {
        errorMSG = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password1.trimmingCharacters(in: .whitespaces).isEmpty,
              !password2.trimmingCharacters(in: .whitespaces).isEmpty else {
            
                errorMSG = "Please fill in all fields."
                    return false
              }
        
        guard email.contains("@") && email.contains(".")
               else {
            
            errorMSG = "Please enter a valid email."
                  return false
              }
        
        guard password1 == password2
               else {
            
            errorMSG = "Passwords do not match."
                  return false
              }
        print("valid user info")
        return true
    }
}
