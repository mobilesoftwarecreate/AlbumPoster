//
//  PostSearching.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.10.03.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import Foundation
import ReactiveSwift

public protocol PostSearching {
	func searchPost(userId: UInt64) -> SignalProducer<PostEntity, NetworkError>
}
