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
private var count: Int = 0

class HorizontalLayoutViewController: UIViewController, UICollectionViewDataSource {

	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var scrollView: UIScrollView!
	
	/*
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
			let itemWidth = view.bounds.width / 3.0
			let itemHeight = layout.itemSize.height
			layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
			layout.invalidateLayout()
			
			print("count : \(count)")
			count += 1
			print("Item Height : \(layout.itemSize.height)")
		}
	}
	*/
	
	override func viewDidLoad() {
        super.viewDidLoad()

		self.collectionView.dataSource = self
		// self.collectionView.delegate = self
		
		self.collectionView.showsHorizontalScrollIndicator = true
		self.collectionView.isPagingEnabled = false
		
		// MARK: Setting UICollectionView Layout
		/*
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		layout.minimumInteritemSpacing = 0
		layout.minimumLineSpacing = 5
		
		
		let cellHeightSpace = layout.sectionInset.top + layout.sectionInset.bottom
		layout.itemSize = CGSize(width: self.collectionView.bounds.width / 3, height: self.collectionView.contentSize.height - cellHeightSpace)
		
		debugPrint("ContentSize.width : " + self.collectionView.contentSize.width.description)
		debugPrint("ContentSize.height : " + self.collectionView.contentSize.height.description)
		*/
		
		// self.collectionView.setCollectionViewLayout(layout, animated: true)
		// self.collectionView.collectionViewLayout = layout
		
		// Function Call : Horizontal Scroll in UIScrollView
		setupScrollView()
    }
	
	func setupScrollView() {
		let imageWidth = self.scrollView.frame.width
		let imageHeight = self.scrollView.frame.height
		let restaurantImageCount = 5 // restaurantImages.count - 1
		
		for i in 0...restaurantImageCount {
			let image: UIImageView = UIImageView()
			image.frame = CGRect(x: imageWidth * CGFloat(i), y: 0, width: imageWidth, height: imageHeight)
			image.image = UIImage(named: restaurantImages[i].restaurantImage)
			image.sizeToFit()
			
			self.scrollView.addSubview(image)
		}
		
		// Get scrollView contentSize width
		self.scrollView.contentSize.width = self.scrollView.frame.width * CGFloat(restaurantImageCount)
		
		self.scrollView.isPagingEnabled = true
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


// MARK: UICollectionViewDelegateFlowLayout

extension HorizontalLayoutViewController:  UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 5
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		if indexPath.row == 0 {
			return CGSize(width: UIScreen.main.bounds.width, height: 180)
		} else {
			return CGSize(width: 180, height: 180)
		}
	}
}





























