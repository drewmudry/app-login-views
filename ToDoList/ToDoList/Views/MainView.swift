//
//  ContentView.swift
//  ToDoList
//
//  Created by Drew on 5/22/23.
//

import SwiftUI

struct MainView: View {
    @State var ViewModel = MainViewViewModel()
    var body: some View {
        if ViewModel.isSignedIn,
           !ViewModel.currentUserID.isEmpty {
            //show signed in state
            ToDoListView()
        } else {
            LoginView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
