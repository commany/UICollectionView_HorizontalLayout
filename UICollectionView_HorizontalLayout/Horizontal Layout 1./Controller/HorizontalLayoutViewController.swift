//
//  HorizontalLayoutViewController.swift
//  UICollectionView_HorizontalLayout
//
//  Created by commany_mac on 2017. 10. 11..
//  Copyright © 2017년 CommanyShin. All rights reserved.
//

import UIKit

// MARK: Model
var restaurantImages = [
	RestaurantImages(restaurantImage: "barrafina.jpg"),
	RestaurantImages(restaurantImage: "bourkestreetbakery.jpg"),
	RestaurantImages(restaurantImage: "cafedeadend.jpg"),
	RestaurantImages(restaurantImage: "cafeloisl.jpg"),
	RestaurantImages(restaurantImage: "cafelore.jpg"),
	RestaurantImages(restaurantImage: "confessional.jpg"),
	RestaurantImages(restaurantImage: "donostia.jpg"),
	RestaurantImages(restaurantImage: "fiveleaves.jpg"),
	RestaurantImages(restaurantImage: "forkeerestaurant.jpg"),
	RestaurantImages(restaurantImage: "grahamavenuemeats.jpg"),
	RestaurantImages(restaurantImage: "haighschocolate.jpg"),
	RestaurantImages(restaurantImage: "homei.jpg"),
	RestaurantImages(restaurantImage: "palominoespresso.jpg"),
	RestaurantImages(restaurantImage: "petiteoyster.jpg"),
	RestaurantImages(restaurantImage: "royaloak.jpg"),
	RestaurantImages(restaurantImage: "teakha.jpg"),
	RestaurantImages(restaurantImage: "thaicafe.jpg"),
	RestaurantImages(restaurantImage: "traif.jpg"),
	RestaurantImages(restaurantImage: "upstate.jpg"),
	RestaurantImages(restaurantImage: "wafflewolf.jpg")
]

private let reuseIdentifier = "HorizontalCell"

class HorizontalLayoutViewController: UIViewController, UICollectionViewDataSource {

	@IBOutlet weak var collectionView: UICollectionView!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		self.collectionView.dataSource = self
		
		self.collectionView.showsHorizontalScrollIndicator = true
		self.collectionView.isPagingEnabled = false
		
		// MARK: Setting UICollectionView Layout
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		layout.minimumInteritemSpacing = 5
		
		let cellHeightSpace = layout.sectionInset.top + layout.sectionInset.bottom
		layout.itemSize = CGSize(width: 200, height: self.collectionView.contentSize.height - cellHeightSpace)
		
		debugPrint(self.collectionView.contentSize.height - cellHeightSpace)
		
		self.collectionView.setCollectionViewLayout(layout, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: UICollectionViewDataSource
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return restaurantImages.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HorizontalLayoutCollectionViewCell
		
		cell.imageView.image = UIImage(named: restaurantImages[indexPath.row].restaurantImage)
		
		return cell
	}
}

/****
// MARK: UICollectionViewDelegateFlowLayout
extension HorizontalLayoutViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 50, left: 5, bottom: 50, right: 5)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 200, height: 150)
	}
}
***/




























