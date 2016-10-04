//
//  PostSearchSpec.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.10.04.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import Foundation
import Quick
import Nimble
import ReactiveSwift
@testable import AlbumPosterModel

class PostSearchSpec: QuickSpec {
	
	class GoodStubNetwork: Networking {
		
		func requestJson(url: String, parameters: [String : Any]?) -> SignalProducer<Any, NetworkError> {
			
			return SignalProducer { observer, disposable in
				observer.send(value: postJson)
				observer.sendCompleted()
				}.observe(on: QueueScheduler())
		}
	}
	
	class BadStubNetwork: Networking {
		func requestJson(url: String, parameters: [String : Any]?) -> SignalProducer<Any, NetworkError> {
			let json = [Any]()
			
			return SignalProducer { observer, disposable in
				observer.send(value: json)
				observer.sendCompleted()
				}.observe(on: QueueScheduler())
		}
	}
	
	class ErrorStubNetwork: Networking {
		func requestJson(url: String, parameters: [String : Any]?) -> SignalProducer<Any, NetworkError> {
			return SignalProducer { observer, disposable in
				observer.send(error: .NotConnectedToInternet)
				}.observe(on: QueueScheduler())
		}
	}
	
	override func spec() {
		it("returns posts if the network works correctly.") {
			var response: PostEntity? = nil
			let search = PostSearch(network: GoodStubNetwork())
			search.searchPost(userId: 1)
				.on(value: {
					value in
					response = value
				})
				.start()
			
			expect(response).toEventuallyNot(beNil())
			expect(response?.id).toEventually(equal(1234))
			expect(response?.userId).toEventually(equal(3456))
			expect(response?.title).toEventually(equal("Sample title"))
			expect(response?.body).toEventually(equal("Sample body"))
		}
		it("sends an error if the network returns incorrect data.") {
			var networkError: NetworkError? = nil
			let search = PostSearch(network: BadStubNetwork())
			search.searchPost(userId: 1)
				.on(failed: {
					error in
					networkError = error
				})
				.start()
			
			expect(networkError).toEventually(equal(NetworkError.IncorrectDataReturned))
		}
		it("passes the error sent by the network.") {
			var networkError: NetworkError? = nil
			let search = PostSearch(network: ErrorStubNetwork())
			search.searchPost(userId: 1)
				.on(failed: {
					error in
					networkError = error
				})
				.start()
			
			expect(networkError).toEventually(equal(NetworkError.NotConnectedToInternet))
		}
	}
}
