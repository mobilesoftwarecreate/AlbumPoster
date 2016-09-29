//
//  AlbumEntitySpec.swift
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

class AlbumEntitySpec: QuickSpec {
	override func spec() {
		it("Parse Json data to create a new albumEntity instance.") {
			let response: AlbumEntity? = try? decodeValue(albumJson)
			
			expect(response).notTo(beNil())
			expect(response?.userId) == 456
			expect(response?.id) == 888
			expect(response?.title) == "New photo poster"
		}
	}
}
