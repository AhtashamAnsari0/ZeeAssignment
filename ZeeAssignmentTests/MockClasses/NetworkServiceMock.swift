//
//  NetworkServiceMock.swift
//  ZeeAssignmentTests
//
//  Created by Ahtasham Ansari on 18/07/21.
//

import Foundation
@testable import ZeeAssignment
import RxSwift

class NetworkServiceMock: NetworkServiceProtocol {

    func loadFromServer<T: Codable>(_ url: URL, parameters : [String : Any], type: T.Type) ->  Single<T> {
        return Single<T>.create { single in
            if let path = Bundle.main.path(forResource: "ImagesList", ofType: "json") {
                do {
                    let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(T.self, from: jsonData)
                    single(.success(response))
                } catch let error {
                    single(.failure(error))
                }
            }
            
            return Disposables.create {}
        }
    }
    
}
