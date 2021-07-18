
//
//  Constants.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

import Foundation
import IGListKit

class Thumbnail : Codable  {
	let source : String?
	let width : Int?
	let height : Int?

	enum CodingKeys: String, CodingKey {

		case source = "source"
		case width = "width"
		case height = "height"
	}

    required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		source = try values.decodeIfPresent(String.self, forKey: .source)
		width = try values.decodeIfPresent(Int.self, forKey: .width)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
	}

}
