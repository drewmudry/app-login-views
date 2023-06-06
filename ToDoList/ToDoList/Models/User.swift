//
//  User.swift
//  ToDoList
//
//  Created by Drew on 5/22/23.
//

import Foundation

struct User : Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
