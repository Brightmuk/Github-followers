//
//  NetworkManager.swift
//  Github-fl
//
//  Created by Bright Mukonesi on 09/11/2025.
//

import Foundation

class NetworkManager{
    static let shared = NetworkManager()
    let baseURl = "https://api.github.com/users/"
    private init(){}
    
    func getFollowers(for username: String, page: int, completed: @escaping ([Follower]?, String?) -> Void){
        let endpoint = baseURl + "users/\(username)followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else{
            completed(nil, "This username created an invalid request, please try again")
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print("Error fetching data: \(error)")
                completed(nil, "Error fetching data, please try again")
                return
            }
            guard let data = data else{
                print("No data returned from server")
                completed(nil, "No data returned from server")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                let reason: String

                reason = "Server returned status code other than 200"

                reason = "Server returned status code other than 200"

                completed(nil, reason)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
                
            }catch{
                completed(nil, "THe data received was not in the correct format")
            }
          
        }
        task.resume()
    }
}
