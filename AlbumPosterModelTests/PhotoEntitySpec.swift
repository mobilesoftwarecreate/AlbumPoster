//
//  PhotoEntitySpec.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.09.29.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Himotoki

@testable import AlbumPosterModel

class PhotoEntitySpec: QuickSpec {
	override func spec() {
		it("Parse Json data to create a new photoEntity instance.") {
			let response: PhotoEntity? = try? decodeValue(photoJson)
			
			expect(response).notTo(beNil())
			expect(response?.albumId) == 456
			expect(response?.id) == 987
			expect(response?.title) == "Sunny day photo"
			expect(response?.url) == "http://www.photo.blog"
			expect(response?.thumbnailUrl) == "http://wwww.miniphoto.pl"
		}
	}
}
