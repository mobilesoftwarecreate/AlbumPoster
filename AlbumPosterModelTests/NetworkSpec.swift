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
				let producer = network.requestJson(url: url, parameters: ["a": "b" as Any, "x": "Y" as Any])
				producer.on(starting: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, started: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, event: <#T##((Event<Any, NetworkError>) -> Void)?##((Event<Any, NetworkError>) -> Void)?##(Event<Any, NetworkError>) -> Void#>, value: <#T##((Any) -> Void)?##((Any) -> Void)?##(Any) -> Void#>, failed: <#T##((NetworkError) -> Void)?##((NetworkError) -> Void)?##(NetworkError) -> Void#>, completed: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, interrupted: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, terminated: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, disposed: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>).start()
				
				
				//.on(next: { json = $0 as? [String: Any]}).start()
				
				
				network.requestJSON(url: url, parameters: ["a": "b", "x": "y"])
					.on(next: { json = $0 as? [String: Any] })
					.start()
				
				expect(json).toEventuallyNot(beNil(), timeout: 5)
				expect((json?["args"] as? [String: AnyObject])?["a"] as? String)
					.toEventually(equal("b"), timeout: 5)
				expect((json?["args"] as? [String: AnyObject])?["x"] as? String)
					.toEventually(equal("y"), timeout: 5)
			}
			it("eventually gets an error if the network has a problem.") {
				var error: NetworkError? = nil
				let url = "https://not.existing.server.comm/get"
				network.requestJSON(url: url, parameters: ["a": "b", "x": "y"])
					.on(failed: { error = $0 })
					.start()
				
				expect(error)
					.toEventually(equal(NetworkError.NotReachedServer), timeout: 5)
			}
		}
	}
}
