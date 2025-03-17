//
//  ContentView.swift
//  SimpleAPICall
//
//  Created by Mac on 17/09/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var apiService = APIService()
    
    var body: some View {
        NavigationView {
            VStack {
                List(apiService.posts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                Button(action: {
                    apiService.fetchPosts()
                }) {
                    Text("Refresh Data")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Posts")
        }
        .onAppear {
            apiService.fetchPosts()
        }
    }
}

#Preview {
    ContentView()
}
