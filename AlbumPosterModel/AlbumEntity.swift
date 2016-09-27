//
//  AlbumsEntity.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.09.27.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import Foundation
import Himotoki

public struct AlbumEntity {
	public let userId: UInt64
	public let id: UInt64
	public let title: String
}

extension AlbumEntity: Decodable {
	public static func decode(_ e: Extractor) throws -> AlbumEntity {
		let albumEntity = try AlbumEntity(
			userId: e <| "userId",
			id: e <| "id",
			title: e <| "title")
		
		return albumEntity
	}
}
