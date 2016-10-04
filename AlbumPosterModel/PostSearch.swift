//
//  PostSearch.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.10.03.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result
import Himotoki

public final class PostSearch: PostSearching {
	fileprivate let network: Networking
	
	public init(network: Networking) {
		self.network = network
	}
	
	public func searchPost(userId: UInt64) -> SignalProducer<PostEntity, NetworkError> {
		let url = PostRequest.apiURL
		let parameters = PostRequest.requestParameters(userId: userId)
		
		return network.requestJson(url: url, parameters: parameters)
			.attemptMap { json in
				if let response = (try? decodeValue(json)) as PostEntity? {
					return Result(value: response)
				} else {
					return Result(error: .IncorrectDataReturned)
				}
		}
	}
}
