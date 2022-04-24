//
//  MypageViewController.swift
//  ramentabetai
//
//  Created by Kazuki Omori on 2022/04/13.
//

import UIKit

private let headerIdentifer = "ProfileHeader"

class MypageViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var user:User? {
        didSet { navigationItem.title = user?.name}
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUser()
//        configureCollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: "ProfileCell")
        collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileHeader")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchUser()
    }
    
    func fetchUser() {
        UserService.fetchUser { user in
            self.user = user
        }
    }
    
//    func configureCollectionView() {
//        collectionView.backgroundColor = .white
//        collectionView.register(ProfileCell.self,
//                                forCellWithReuseIdentifier: cellIdentifer)
//        collectionView.register(ProfileHeader.self,
//                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//                                withReuseIdentifier: headerIdentifer)
//    }
}

extension MypageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath)
//        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
//        let cellImage = UIImage(named: "ラーメン")
//        imageView.image = cellImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileHeader", for: indexPath) as! ProfileHeader
//        header.profileImage.image = UIImage(named: "userProfile")
//        header.setCellWithValueOf()
        return header
    }
}

extension MypageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 240)
    }
}
