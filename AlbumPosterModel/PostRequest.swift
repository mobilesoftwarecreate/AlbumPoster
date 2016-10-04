//
//  Post.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.10.03.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import Foundation

internal struct PostRequest {
	internal static let apiURL = "http://jsonplaceholder.typicode.com/posts/"
	
	internal static func requestParameters(userId: UInt64) -> [String: Any] {
		return [
			"userId": userId
		]
	}
}
