
//
//  Constants.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

import Foundation

struct Pages : Codable {
	var imageList : [ImageData]?
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CustomCoadingKeys.self)
        imageList = []
        for key in values.allKeys {
            if let coadinngKeys = CustomCoadingKeys(stringValue: key.stringValue), let result = try? values.decode(ImageData.self, forKey: coadinngKeys) {
                self.imageList?.append(result)
            }
        }
	}
    struct CustomCoadingKeys: CodingKey {
        var stringValue: String
                
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int?
        
        init?(intValue: Int) {
            return nil
        }
    }

}
