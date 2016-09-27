//
//  UserEntity.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.09.27.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import Foundation
import Himotoki

public struct UserEntity {
	public let id: UInt64
	public let name: String
	public let username: String
	public let email: String
}

extension UserEntity: Decodable {
	public static func decode(_ e: Extractor) throws -> UserEntity {
		let userEntity = try UserEntity(
			id: e <| "id",
			name: e <| "name",
			username: e <| "username",
			email: e <| "email")
		
		return userEntity
	}
}
