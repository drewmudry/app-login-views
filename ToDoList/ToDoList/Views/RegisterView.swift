//
//  RegisterView.swift
//  ToDoList
//
//  Created by Drew on 5/22/23.
//

import SwiftUI


struct RegisterView: View {
    
    @StateObject var ViewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "To Do List", subtitle: "Get Things Done", angle: -15, background: .teal)
                .offset(y:-40)
            Form{
                
                if !ViewModel.errorMSG.isEmpty {
                    Text(ViewModel.errorMSG)
                        .foregroundColor(.red)
                }
                
                TextField("Name", text: $ViewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Email Address", text: $ViewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Password", text: $ViewModel.password1)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)

                SecureField("Re-enter Password", text: $ViewModel.password2)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)

                Button {
                    ViewModel.register()
                }
                
                label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.green)
                        Text("Create Account")
                            .foregroundColor(Color.white)
                            .bold()
                        }
                    }
                }
            .padding(.top, -70)
            .padding(.bottom, 60)
        }
        Spacer()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
