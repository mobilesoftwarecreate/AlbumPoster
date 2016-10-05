//
//  PostSearchTableViewModel.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.10.05.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import AlbumPosterModel

public final class PostSearchTableViewModel: PostSearchTableViewModeling {
	private let postSearch: PostSearching
	
	public init (postSearch: PostSearching) {
		self.postSearch = postSearch
	}
}

