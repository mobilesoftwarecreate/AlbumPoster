//
//  DetailViewController.swift
//  AlbumPoster
//
//  Created by Michał Szafrański on 2016.09.20.
//  Copyright © 2016 e-szafranski.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	@IBOutlet weak var detailDescriptionLabel: UILabel!


	func configureView() {
		// Update the user interface for the detail item.
		if let detail = self.detailItem {
		    if let label = self.detailDescriptionLabel {
		        label.text = detail.timestamp!.description
		    }
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.configureView()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	var detailItem: Event? {
		didSet {
		    // Update the view.
		    self.configureView()
		}
	}


}

