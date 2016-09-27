//
//  PostEntitySpec.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.09.27.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Himotoki

import XCTest
@testable import AlbumPosterModel

class PostEntitySpec: QuickSpec {
	override func spec() {
		describe("check decode") {
			it("parse Json data to create new post instance.") {
				let post: PostEntity? = try? decodeValue(postJson)
				
				expect(post).notTo(beNil())
				expect(post?.id) == 1234
				expect(post?.userId) == 3456
				expect(post?.title) == "Sample title"
				expect(post?.body) == "Sample body"
			}
		}
	}
}
