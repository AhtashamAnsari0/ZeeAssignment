
//
//  Constants.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

import Foundation

struct Continue : Codable {
	let gpsoffset : Int?
	let continueYes : String?

	enum CodingKeys: String, CodingKey {

		case gpsoffset = "gpsoffset"
		case continueYes = "continue"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		gpsoffset = try values.decodeIfPresent(Int.self, forKey: .gpsoffset)
        continueYes = try values.decodeIfPresent(String.self, forKey: .continueYes)
	}

}
