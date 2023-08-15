//
//  FileCollectionViewController.swift
//  pro_2
//
//  Created by Gaurav Sara on 13/08/23.
//

import UIKit

class FileCollectionViewController: UICollectionViewController {
    @IBOutlet var fileColeectionView: UICollectionView!
    
    var fileTitle = Array(repeating: "Video name here if the title is long", count: 30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Library"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.label
        
        fileColeectionView.backgroundColor = UIColor.systemGray6
        fileColeectionView.collectionViewLayout = UICollectionViewFlowLayout()

        fileColeectionView.register(UINib(nibName: "FileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FileCollectionViewCell")
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fileTitle.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FileCollectionViewCell", for: indexPath) as? FileCollectionViewCell else { return FileCollectionViewCell() }
    
        cell.title = fileTitle[indexPath.row]
        return cell
    }
}

extension FileCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = fileColeectionView.bounds.width
        
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
