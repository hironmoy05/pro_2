//
//  FileViewController.swift
//  pro_2
//
//  Created by Gaurav Sara on 14/08/23.
//

import UIKit

class FileViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet weak var fileViewCollectionView: UICollectionView!
    @IBOutlet weak var uiBackgroundView: UIView!
    @IBOutlet weak var navigationBack: UIBarButtonItem!
    @IBOutlet weak var collectionViewBackground: UICollectionView!
    
    var fileTitle = Array(repeating: "Video name here if the title is long", count: 30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem.title = "Library"
//        navigationItem.largeTitleDisplayMode = .never
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"),
//                style: .plain,
//                target: self,
//                action: #selector(backButtonTapped))
        
        navigationController?.delegate = self
        
        navigationBack.action = #selector(backButtonTapped)
        
        navigationItem.leftBarButtonItem?.tintColor = UIColor.label
        
//        uiBackgroundView.backgroundColor = UIColor.systemGray6
        collectionViewBackground.backgroundColor = UIColor.systemGray6
        
        fileViewCollectionView.collectionViewLayout = UICollectionViewFlowLayout()

        fileViewCollectionView.register(UINib(nibName: "FileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FileCollectionViewCell")
        
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
           if viewController is FileViewController {
               navigationController.setNavigationBarHidden(true, animated: animated)
           } else {
               navigationController.setNavigationBarHidden(false, animated: animated)
           }
       }
}

extension FileViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fileTitle.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FileCollectionViewCell", for: indexPath) as? FileCollectionViewCell else { return FileCollectionViewCell() }
    
        
        cell.title = fileTitle[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = fileViewCollectionView.frame.width
        
        return CGSize(width: collectionWidth / 2.2, height: collectionWidth / 2.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10 // It's a default value
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }
}
