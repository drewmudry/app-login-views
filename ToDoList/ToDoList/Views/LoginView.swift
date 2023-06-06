//
//  LoginView.swift
//  ToDoList
//
//  Created by Drew on 5/22/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var ViewModel = LoginViewViewModel()

    var body: some View {
        NavigationView{
            VStack{
                // Header
                HeaderView(title: "To Do List", subtitle: "Knock Tasks Out", angle: 15, background: .blue)
                
                // Login Form
                Form {
                    //show error message if an error occurs
                    if !ViewModel.errorMSG.isEmpty {
                        Text(ViewModel.errorMSG)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Username", text: $ViewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    SecureField("Password", text: $ViewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
 
                    Button {
                        ViewModel.login()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.green)
                            Text("Login")
                                .foregroundColor(Color.white)
                                .bold()
                            }
                    }
                    
                }
                
                // Registration
                VStack{
                    Text("Don't have an account?")
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom, 30)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
