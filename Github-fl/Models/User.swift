//
//  User.swift
//  Github-fl
//
//  Created by Bright Mukonesi on 05/11/2025.
//

import Foundation

struct User: Codable{
    var login: String
    var avatarUrl: String
    var name: String?
    var publicRepos: Int
    var publicGists: Int
    var followers: Int
    var following: Int
    var location: String?
    var bio: String?
    var htmlUrl: String
    var createdAt: Date
}
