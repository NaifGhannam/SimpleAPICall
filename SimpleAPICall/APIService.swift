//
//  APIService.swift
//  SimpleAPICall
//
//  Created by Mac on 17/09/1446 AH.
//
import Foundation

class APIService: ObservableObject {
    @Published var posts: [Post] = []
    
    func fetchPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching posts:", error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    self.posts = decodedPosts
                }
            } catch {
                print("Error decoding JSON:", error.localizedDescription)
            }
        }.resume()
    }
}
