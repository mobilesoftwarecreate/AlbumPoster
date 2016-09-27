//
//  PhotoEntity.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.09.27.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import Foundation
import Himotoki

public struct PhotoEntity {
	public let albumId: UInt64
	public let id: UInt64
	public let title: String
	public let url: String
	public let thumbnailUrl: String
}

extension PhotoEntity: Decodable {
	public static func decode(_ e: Extractor) throws -> PhotoEntity {
		let photoEntity = try PhotoEntity(
			albumId: e <| "albumId",
			id: e <| "id",
			title: e <| "title",
			url: e <| "url",
			thumbnailUrl: e <| "thumbnailUrl")
		
		return photoEntity
	}
}
