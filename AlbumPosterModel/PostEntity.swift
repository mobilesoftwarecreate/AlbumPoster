//
//  PostEntity.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.09.27.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import Foundation
import Himotoki

public struct PostEntity {
	public let id: UInt64
	public let userId: UInt64
	public let title: String
	public let body: String
}

extension PostEntity: Decodable {
	public static func decode(_ e: Extractor) throws -> PostEntity {
		let postEntity = try PostEntity(
			id: e <| "id",
			userId: e <| "userId",
			title: e <| "title",
			body: e <| "body")
		
		return postEntity
	}
}
