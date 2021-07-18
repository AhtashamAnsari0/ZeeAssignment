//
//  ConfigurationManager.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

import Foundation

class ConfigurationManager {
    func buildURL(for subEndpoint: String = "") -> URL? {
        let strURL = "\(ConfigurationDetail.baseURL)\(EndPoints.imageEndpoint)\(subEndpoint)"
        let encodedStr = strURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
        return URL(string: encodedStr)
    }
}
