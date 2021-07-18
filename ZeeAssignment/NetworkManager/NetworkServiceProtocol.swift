//
//  NetworkServiceProtocol.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

import Foundation
import RxSwift

protocol NetworkServiceProtocol {
    func loadFromServer<T: Codable>(_ url: URL, parameters : [String : Any], type: T.Type) ->  Single<T>
}
