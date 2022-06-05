//
//  APIService.swift
//  Unsplash_Ex
//
//  Created by KEEN on 2022/06/05.
//

import Foundation

enum AppError {
    case success
    case failure
}
struct APIService {
    func fetchUnplash(page: Int, completion: @escaping ([UnsplashType]?, AppError) -> Void) {
        let baseUrl = "https://api.unsplash.com/photos?page=\(page)&per_page=24&client_id=\(Bundle.main.apikey)"
        
        if let url = URL(string: baseUrl) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    print("Fetch - Error : \(error!.localizedDescription)")
                    return
                }
                
                guard response as? HTTPURLResponse != nil else { return }
                guard let data = data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    let unsplashInfo = try decoder.decode([UnsplashType].self, from: data)
                    completion(unsplashInfo, .success)
                } catch {
                    completion(nil, .failure)
                }
            }.resume()
        }
    }
}
