
//
//  Constants.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

import Foundation

struct ImageList : Codable {
	let batchComplete : String?
	let continueYes : Continue?
	let query : Query?

	enum CodingKeys: String, CodingKey {

		case batchComplete = "batchcomplete"
		case continueYes = "continue"
		case query = "query"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        batchComplete = try values.decodeIfPresent(String.self, forKey: .batchComplete)
        continueYes = try values.decodeIfPresent(Continue.self, forKey: .continueYes)
		query = try values.decodeIfPresent(Query.self, forKey: .query)
	}

}
