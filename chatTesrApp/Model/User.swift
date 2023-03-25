//
//  User.swift
//  chatTesrApp
//
//  Created by admin1 on 25.03.23.
//

import Foundation

// MARK: - User
struct User: Codable {
    let profileData: ProfileData

    enum CodingKeys: String, CodingKey {
        case profileData = "profile_data"
    }
}

struct ProfileData: Codable {
    let name, username, birthday, city: String
    let vk, instagram, status, avatar: String
    let id: Int
    let last: String
    let online: Bool
    let created, phone: String
    let completedTask: Int
    let avatars: Avatars

    enum CodingKeys: String, CodingKey {
        case name, username, birthday, city, vk, instagram, status, avatar, id, last, online, created, phone
        case completedTask = "completed_task"
        case avatars
    }
}

struct Avatars: Codable {
    let avatar, bigAvatar, miniAvatar: String
}

// MARK: - CheckAuthCode
struct CheckAuthCode: Codable {
    let refreshToken, accessToken: String
    let userID: Int
    let isUserExists: Bool

    enum CodingKeys: String, CodingKey {
        case refreshToken = "refresh_token"
        case accessToken = "access_token"
        case userID = "user_id"
        case isUserExists = "is_user_exists"
    }
}

// MARK: - RegistredUser
struct RegistredUser: Codable {
    let refreshToken, accessToken: String
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case refreshToken = "refresh_token"
        case accessToken = "access_token"
        case userID = "user_id"
    }
}

// MARK: - Token
struct Token: Codable {
    let refreshToken, accessToken: String
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case refreshToken = "refresh_token"
        case accessToken = "access_token"
        case userID = "user_id"
    }
}
