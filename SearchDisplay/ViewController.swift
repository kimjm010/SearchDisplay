//
//  ViewController.swift
//  SearchDisplay
//
//  Created by Chris Kim on 10/18/22.
//

import Foundation
import UIKit
import SnapKit
import Then


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.largeContentTitle = "검색"
        
        setupScrollView()
    }
}




// MARK: - UI Setting
extension ViewController {
    
    /// Set up Deafult ScrollView
    fileprivate func setupScrollView() {
        
        // MARK: - Create Search Bar
        
        let searchImageView = UIImageView().then {
            $0.image = UIImage(systemName: "magnifyingglass")
            $0.tintColor = .systemGray2
        }
        
        let searchTextField = UITextField().then {
            $0.text = "아이템을 검색해 보세요"
            $0.borderStyle = .none
            $0.textColor = .systemGray2
        }
        
        let searchContainerView = UIView().then {
            $0.addSubview(searchImageView)
            $0.addSubview(searchTextField)
            
            $0.backgroundColor = .systemGray6
            $0.layer.cornerRadius = 6
        }
        
        searchImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(20)
            $0.leading.equalToSuperview().offset(13)
        }
        
        searchTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(searchImageView.snp.trailing).offset(8)
        }
        
        // MARK: - Create Scroll View
        
        let scrollView = UIScrollView().then {
            $0.addSubview(searchContainerView)

            
            $0.alwaysBounceVertical = true
            $0.isUserInteractionEnabled  = true
        }
        
        searchContainerView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide.snp.edges).inset(16)
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width)
        }

        self.view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}



#if DEBUG

import SwiftUI

struct ViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}


struct ViewControllerPresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerPresentable()
            .previewDevice("iPhone 12")
            .ignoresSafeArea()
    }
}

#endif
