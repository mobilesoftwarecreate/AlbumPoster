//
//  AppDelegateSpec.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.10.05.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import Quick
import Nimble
import Swinject
import SwinjectStoryboard
import AlbumPosterModel
import AlbumPosterViewModel
import AlbumPosterView

@testable import AlbumPoster

class AppDelegateSpec: QuickSpec {
	override func spec() {
		var container: Container!
		beforeEach {
			container = AppDelegate().container
		}
		
		describe("Container") {
			it("resolves every service type.") {
				// Models
				expect(container.resolve(Networking.self)).notTo(beNil())
				expect(container.resolve(PostSearching.self)).notTo(beNil())
				
				// ViewModels
				expect(container.resolve(PostSearchTableViewModeling.self)).notTo(beNil())
			}
			it("injects view models to views.") {
				let bundle = Bundle(for: PostSearchTableViewController.self)
				let storyboard = SwinjectStoryboard.create(
					name: "Main",
					bundle: bundle,
					container: container)
				let postSearchTableViewController = storyboard.instantiateViewController(withIdentifier: "PostSearchTableViewController") as! PostSearchTableViewController
				
				expect(postSearchTableViewController.viewModel).notTo(beNil())
			}
		}
	}
}

