//
//  DataGetter.swift
//  herconomyApp
//
//  Created by Decagon on 05/11/2021.
//

import UIKit
class LoadData {
  func fetchData(completionHandler: @escaping (Details)-> () ){
    let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=e372da35733a7522e1133347baea2a59&language=en-US&page=1"
    if let url = URL(string: urlString) {
      URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
          print("Eror: \(error.localizedDescription)")
        }
        guard let response = response as? HTTPURLResponse, response.statusCode == 200
        else {
          print("Error : HTTP Response Code Error")
          return
        }
        
        guard let data = data else{
          print("Error: No Response")
          return
        }
          do {
            let result = try JSONDecoder().decode(Details.self, from: data)
            print("https://image.tmdb.org/t/p/w342\(result.results[0].poster_path)")
            DispatchQueue.main.async {
              completionHandler(result)
            }
          } catch {
            print(error.localizedDescription)
          }
      }.resume()
    }
    
  }
}
