//
//  AstrologyApi.swift
//  astro
//
//  Created by Furkan Torun on 27.10.2020.
//

import Foundation
import Alamofire

public protocol AstroApiServiceProtocol {
    func fetchAstroDetail(astroFilter: AstroFilter, completion: @escaping (Result<AstroDetail>) -> Void)
}

class AstroApiService : AstroApiServiceProtocol {
    
    public enum Error: Swift.Error {
        case parameterParsingError(internal: Swift.Error)
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    public init() {}
    func fetchAstroDetail(astroFilter: AstroFilter, completion: @escaping (Result<AstroDetail>) -> Void) {
        let urlString = "https://json.astrologyapi.com/v1/astro_details"
        var request = URLRequest(url: URL(string:urlString)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.setValue("Basic NjE0NjY2OjBlZmQyMzZmY2YxMThkYzk2MGMzZTg2ZDI3ODUwYjli", forHTTPHeaderField: "authorization")
        
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(astroFilter)
            request.httpBody = jsonData
        } catch {
            completion(.failure(Error.parameterParsingError(internal: error)))
        }
                
        AF.request(request).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(AstroDetail.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }
}
