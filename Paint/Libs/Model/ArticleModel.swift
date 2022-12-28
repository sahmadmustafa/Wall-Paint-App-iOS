

import Foundation
struct ArticleModel : Codable {
	let title : String?
	let summary : String?
	let article : String?

	enum CodingKeys: String, CodingKey {

		case title = "title"
		case summary = "summary"
		case article = "article"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		summary = try values.decodeIfPresent(String.self, forKey: .summary)
		article = try values.decodeIfPresent(String.self, forKey: .article)
	}

}
