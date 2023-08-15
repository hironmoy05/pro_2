//
//  ViewController.swift
//  pro_2
//
//  Created by Gaurav Sara on 12/08/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var toggleButon: UIImageView!

    var playListTitle = Array(repeating: "Playlist Name", count: 30)
    var playListSubTitle = Array(repeating: "231 items", count: 30)
    
    var isGridViewVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.systemGray6
        collectionView.backgroundColor = UIColor.systemGray6
        
        collectionView.isHidden = true
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        // enable tap gesture for toggleButton UIImageView
        toggleButon.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        toggleButon.addGestureRecognizer(tapGesture)
    }
    
    @objc func imageViewTapped() {
        isGridViewVisible.toggle()
        
        tableView.isHidden = isGridViewVisible
        collectionView.isHidden = !isGridViewVisible
        
        toggleButon.image = UIImage(systemName: isGridViewVisible ? "tablecells" : "rectangle.grid.1x2")
    }
}

