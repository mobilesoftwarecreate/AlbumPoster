//
//  NetworkSpec.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.09.29.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import Foundation
import Quick
import Nimble
import ReactiveCocoa
import ReactiveSwift
@testable import AlbumPosterModel

class NetworkSpec: QuickSpec {
	override func spec() {
		var network: Network!
		beforeEach {
			network = Network()
		}
		
		describe("JSON") {
			it("eventually gets JSON data as specified with parameters.") {
				var json: [String: Any]? = nil
				let url = "https://httpbin.org/get"
				network.requestJson(url: url, parameters: ["a": "b" as Any, "x": "y" as Any])
					.on(starting: {
							print("Starting")
						}, started: {
							print("Started")
						}, value: {
							value in
							print("Next: \(value)")
							json = value as? [String: Any]
						}, failed: {
							error in
							print("Failed: \(error)")
						}, completed: {
							print("completed")
						}, interrupted: {
							print("interrupted")
						}, terminated: {
							print("terminated")
						}, disposed: {
							print("disposed")
					}).start()
				
				expect(json).toEventuallyNot(beNil(), timeout: 5)
				expect((json?["args"] as? [String: Any])?["a"] as? String)
					.toEventually(equal("b"), timeout: 5)
				expect((json?["args"] as? [String: Any])?["x"] as? String)
					.toEventually(equal("y"), timeout: 5)
			}
			it("eventually gets an error if the network has a problem.") {
				var error: NetworkError? = nil
				let url = "https://not.existing.server.comm/get"
				network.requestJson(url: url, parameters: ["a": "b" as Any, "x": "y" as Any])
					.on(starting: {
						print("Starting")
						}, started: {
							print("Started")
						}, value: {
							value in
							print("Next: \(value)")
						}, failed: {
							error2 in
							print("Failed: \(error2)")
							error =  error2
						}, completed: {
							print("completed")
						}, interrupted: {
							print("interrupted")
						}, terminated: {
							print("terminated")
						}, disposed: {
							print("disposed")
					}).start()
				
				expect(error)
					.toEventually(equal(NetworkError.NotReachedServer), timeout: 5)
			}
		}
	}
}
