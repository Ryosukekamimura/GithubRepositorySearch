//
//  FollowingUserStore.swift
//  GithubRepositoryApp
//
//  Created by 神村亮佑 on 2020/06/21.
//  Copyright © 2020 神村亮佑. All rights reserved.
//


import Foundation
import Combine

class FollowingUserStore: ObservableObject{
    @Published var users: [User] = []
    
    init(){
        load()
    }
    
    func load(){
        let url = URL(string: "https://api.github.com/users/RyosukeKamimura/following")!
        URLSession.shared.dataTask(with: url){
            data, response, error in DispatchQueue.main.async{
                self.users = try! JSONDecoder().decode([User].self, from: data!)
            }
        }.resume()
    }
}

struct User: Decodable, Identifiable {
    var id: Int
    var login: String
}
