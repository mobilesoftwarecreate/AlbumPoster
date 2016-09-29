//
//  UserEntitySpec.swift
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

class UserEntitySpec: QuickSpec {
	override func spec() {
		it("Parse Json data to create a new userEntity instance.") {
			let response: UserEntity? = try? decodeValue(userJson)
			
			expect(response).notTo(beNil())
			expect(response?.id) == 456
			expect(response?.name) == "Tom"
			expect(response?.username) == "Bimbambo"
			expect(response?.email) == "Tom@bimbambo.com"
		}
	}
}
