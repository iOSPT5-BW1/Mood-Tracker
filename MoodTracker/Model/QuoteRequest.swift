//
//  QuoteRequest.swift
//  MoodTracker
//
//  Created by Claudia Contreras on 2/28/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import Foundation


struct QuoteRequest {
    let API_KEY = APIKey()
    let motivationalURL = URL(string: "https://healthruwords.p.rapidapi.com/v1/quotes/?maxR=1&size=large")
    var request: URLRequest?
    
    init() {
        guard let unwrappedURL = motivationalURL else { return }
        var request = URLRequest(url: unwrappedURL)
        request.addValue(API_KEY.API_KEY, forHTTPHeaderField: "x-rapidapi-key")
        
        self.request = request
    }
    
    func getQuote(completion: @escaping(Result<[Quote], Error>) -> Void) {
        guard let request = request else { return }
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode([Quote].self, from: data) as [Quote]

                        let Quote = json
                        completion(.success(Quote))
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            dataTask.resume()
        }
}
    
        
