//
//  Post.swift
//  SimpleAPICall
//
//  Created by Mac on 17/09/1446 AH.
//
import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
