//
//  Constants.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

import Foundation

struct Query : Codable {
	let pages : Pages?

	enum CodingKeys: String, CodingKey {
		case pages = "pages"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		pages = try values.decodeIfPresent(Pages.self, forKey: .pages)
	}

}
