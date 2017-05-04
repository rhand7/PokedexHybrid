//
//  NetworkController.swift
//  PokedexHybrid
//
//  Created by handje on 5/4/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import Foundation

class NetworkController: NSObject {
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    @objc static func performRequest(for url: URL,
                               httpMethodString: String,
                               urlParameters: [String: String]? = nil,
                               body: Data? = nil,
                               completion: ((Data?, Error?) -> Void)? = nil) {
        
        guard let httpMethod = HTTPMethod(rawValue: httpMethodString) else {
            completion?(nil, NSError(domain: "PokedexError", code: 0, userInfo: nil))
            return
        }
        
        let requestURL = self.url(byAdding: urlParameters, to: url)
        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            completion?(data, error)
        }
        
        dataTask.resume()
    }
    
    static func url(byAdding parameters: [String : String]?, to url: URL) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = parameters?.flatMap({URLQueryItem(name: $0.key, value: $0.value)})
        
        guard let url = components?.url else {
            fatalError("URL optional is nil")
        }
        return url
    }
}
