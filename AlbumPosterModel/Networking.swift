//
//  Networking.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.09.29.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import ReactiveCocoa
import ReactiveSwift

public protocol Networking {
	func requestJson(url: String, parameters: [String: Any]?) -> SignalProducer<Any, NetworkError>
}
