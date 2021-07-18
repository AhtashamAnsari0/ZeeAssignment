//
//  NetworkService.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

import Foundation
import Alamofire
import RxSwift

class NetworkService: NetworkServiceProtocol {

    func loadFromServer<T: Codable>(_ url: URL, parameters : [String : Any], type: T.Type) ->  Single<T> {
        return Single<T>.create { single in
            AF.request(url, parameters: parameters).response { response in
                if(response.response?.statusCode == NetworkConstants.Network.successCode) {
                    guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(T.self, from: data)
                        single(.success(response))
                    } catch let error {
                        single(.failure(error))
                    }
                }else {
                    if let error = response.error {
                        single(.failure(error))
                    }
                }
            }
            return Disposables.create {}
        }
    }
    
}
