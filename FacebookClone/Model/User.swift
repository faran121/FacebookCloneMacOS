//
//  User.swift
//  FacebookClone
//
//  Created by Maliks on 01/04/2024.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID().uuidString
    var name: String
    var url: String
}

let users = [
    User(name: "Jessie Samson", url: "https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQi0jEyMDd9&auto=format&fit=crop&w=634&q=80"),
    User(name: "David Brooks", url: "https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQi0jEyMDd9&auto=format&fit=crop&w=592&q=80"),
    User(name: "Carolyn Duncan", url: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQi0jEyMDd9&auto=formāt&fit=crop&w=634&q=80"),
    User(name: "Paul Pinnock", url: "https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&f¡t=crop&w=1350&q=80"),
    User(name: "Elizabeth Wong", url: "https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQi0jF9&auto=format&fit=crop&w=675&q=80"),
    User(name: "Steve Rogers", url: "https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQi0jEyMDd9&auto=format&fit=crop&w=592&q=80"),
    User(name: "Carol Denvers", url: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQi0jEyMDd9&auto=formāt&fit=crop&w=634&q=80"),
    User(name: "Alice Border", url: "https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQi0jEyMDd9&auto=format&fit=crop&w=634&q=80"),
    User(name: "Bruce Banner", url: "https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&f¡t=crop&w=1350&q=80")
]

struct Post: Identifiable {
    var id = UUID().uuidString
    var user: User
    var imageUrl: String
    var title: String
    var likes: String
    var shares: String
    var comments: String
    var postTime: String
}

let posts = [
    Post(user: users[0], imageUrl: "https://images.unsplash.com/photo-1473496169904-658ba7c44d8a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWd]fH8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80", title: "Summer Vacation :)))", likes: "89", shares: "22", comments: "17", postTime: "58"),
    Post(user: users[1], imageUrl: "https://images.unsplash.com/photo-1519150268069-c094cfc0b3c8?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWd]fHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1678&q=80", title: "Cuties :)", likes: "100", shares: "20", comments: "10", postTime: "23"),
    Post(user: users[2], imageUrl: "https://images.unsplash.com/photo-1509316785289-025f5b846b35?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWd]fHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1655&q=80", title: "Enjoying Corono Times 😍", likes: "20", shares: "80", comments: "122", postTime: "15"),
    Post(user: users[3], imageUrl: "https://images.unsplash.com/photo-1509316785289-025f5b846b35?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWd]fHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1655&q=80", title: "Big Surrrrrrrrrr", likes: "100", shares: "122", comments: "177", postTime: "2"),
    Post(user: users[4], imageUrl: "https://images.unsplash.com/photo-1519150268069-c094cfc0b3c8?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWd]fHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1678&q=80", title: "Litter!!!!", likes: "189", shares: "220", comments: "127", postTime: "46"),
]
