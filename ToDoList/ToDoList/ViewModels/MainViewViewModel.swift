//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Drew on 5/22/23.
//
import FirebaseAuth
import Foundation

class MainViewViewModel : ObservableObject{
    @Published var currentUserID = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
                }
            }
    }

    
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}
 
