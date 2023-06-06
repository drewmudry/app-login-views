//
//  HeaderView.swift
//  ToDoList
//
//  Created by Drew on 5/22/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                .offset(y:-105)
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size:30))
                    .foregroundColor(Color.white)
                    
            }
            .padding(.bottom,  100)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
                height: 400)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "To Do List", subtitle: "Knock Tasks Out", angle: 15, background: .blue)
    }
}
