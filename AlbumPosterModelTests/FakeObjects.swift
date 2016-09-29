//
//  FakeObjects.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.09.27.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import Foundation

let postJson: [String: AnyObject] = [
	"id": 1234 as AnyObject,
	"userId": 3456 as AnyObject,
	"title": "Sample title" as AnyObject,
	"body": "Sample body" as AnyObject
]

let userJson: [String: AnyObject] = [
	"id": 456 as AnyObject,
	"name": "Tom" as AnyObject,
	"username": "Bimbambo" as AnyObject,
	"email": "Tom@bimbambo.com" as AnyObject
]

let albumJson: [String: AnyObject] = [
	"userId": 456 as AnyObject,
	"id": 888 as AnyObject,
	"title": "New photo poster" as AnyObject
]

let photoJson: [String: AnyObject] = [
	"albumId": 456 as AnyObject,
	"id": 987 as AnyObject,
	"title": "Sunny day photo" as AnyObject,
	"url": "http://www.photo.blog" as AnyObject,
	"thumbnailUrl": "http://wwww.miniphoto.pl" as AnyObject
]
