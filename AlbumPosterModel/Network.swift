//
//  Network.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.09.29.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import Foundation
import ReactiveSwift
import Alamofire

public final class Network: Networking {
	private let queue = DispatchQueue(label: "AlbumPoster.AlbumPosterModel.Network.Queue")
	
	public init() { }
	
	public func requestJson(url: String, parameters: [String : Any]?) -> SignalProducer<Any, NetworkError> {
		return SignalProducer {
			observer, disposable in
			//let serializer = Alamofire.Request.JSONResponseSerializer()
			Alamofire.request(url, parameters: parameters).responseJSON(queue: self.queue) {
				response in
				switch response.result {
				case .success(let value):
					observer.send(value: value as AnyObject)
					observer.sendCompleted()
				case .failure(let error):
					observer.send(error: NetworkError(error: error as NSError))
				}
			}
		}
	}
	
	
}
