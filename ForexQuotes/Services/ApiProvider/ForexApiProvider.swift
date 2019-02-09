//
//  ForexApiProvider.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import Foundation


enum ForexPaths: String {
    case quotes = "quotes"
    case symbols = "symbols"
}

class ForexApiProvider {
    
    func request<T: Decodable>(path: ForexPaths, parameters: [String:String] = [:], responseAs: T.Type, _ onCompletion: @escaping ([T]) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        var params = parameters
        params.updateValue(ForexApiConstants.baseApiKey, forKey: "api_key")
        guard let url = URL(string: ForexApiConstants.baseUrl + path.rawValue+"?\(params.stringFromHttpParameters())") else {return}
        var request : URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let data = data, error == nil {
                do {
                    let res = try JSONDecoder().decode([T].self, from: data)
                    onCompletion(res)
                } catch {
                    print(error)
                    // TODO: onError
                }
            } else {
                // TODO: onError
            }
        }
        dataTask.resume()
    }
}
