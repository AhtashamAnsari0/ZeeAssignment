
//
//  Constants.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 14/07/21.
//

import Foundation
import IGListKit

class ImageData : Codable, ListDiffable {
	let pageid : Int?
	let ns : Int?
	let title : String?
	let index : Int?
	let thumbnail : Thumbnail?

	enum CodingKeys: String, CodingKey {

		case pageid = "pageid"
		case ns = "ns"
		case title = "title"
		case index = "index"
		case thumbnail = "thumbnail"
	}

    required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		pageid = try values.decodeIfPresent(Int.self, forKey: .pageid)
		ns = try values.decodeIfPresent(Int.self, forKey: .ns)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		index = try values.decodeIfPresent(Int.self, forKey: .index)
		thumbnail = try values.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
	}

    func diffIdentifier() -> NSObjectProtocol {
        return "\(pageid ?? 0)" as NSString
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ImageData else { return false }
        return self.pageid == object.pageid
    }
}
