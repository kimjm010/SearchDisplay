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
import TagListView


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
        
        let searchButton = UIButton().then {
            $0.setTitle("", for: .normal)
            $0.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
            $0.tintColor = UIColor().searchViewTextColor
        }
        
        let searchTextField = UITextField().then {
            $0.text = "아이템을 검색해 보세요"
            $0.borderStyle = .none
            $0.textColor = UIColor().searchViewTextColor
        }
        
        // MARK: - Create Popular Tag View
        
        let recommendationLabel = UILabel().then {
            $0.text = "추천 키워드"
            $0.textColor = .label
            //$0.font = UIFont.nanumGothic(.bold, size: 16)
            $0.font = .systemFont(ofSize: 24)
        }
        
        let recommendationTagView = TagListView().then {
            $0.addTags(["빡코딩", "코딩", "오늘도 빡코딩", "할라피뇨"])
            $0.addTags(["코딩", "빡코딩", "버거킹", "돈까스"])
            $0.addTags(["치즈", "오므라이스", "핫도그", "아이스 아메리카노"])
            //$0.textFont = .nanumGothic(.regular, size: 12)
            $0.textFont = .systemFont(ofSize: 14)
            $0.alignment = .leading
            $0.tagBackgroundColor = .white
            $0.borderColor = .systemGray2
            $0.textColor = UIColor().tagViewTextColor
            $0.cornerRadius = 8
            $0.borderWidth = 1
            $0.marginX = 10
            $0.marginY = 10
            $0.paddingY = 10
            $0.paddingX = 10
        }
        
        let recommendationStackView = UIStackView().then {
            $0.addArrangedSubview(recommendationLabel)
            $0.addArrangedSubview(recommendationTagView)
            
            $0.spacing = 10
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .fill
            $0.backgroundColor = .clear
        }
        
        recommendationLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
        }
        
        // MARK: - Create Popular Keywords
        
        let popularLabel = UILabel().then {
            $0.text = "인기 검색어"
            $0.textColor = .label
            //$0.font = UIFont.nanumGothic(.bold, size: 16)
            $0.font = .systemFont(ofSize: 24)
        }
        
        let popularKeyWords = ["빡코딩", "오늘도 빡코딩", "버거킹", "오므라이스", "핫도그", "아이스크림", "치즈", "빡코딩",
                               "빡코딩", "오늘도 빡코딩", "버거킹", "오므라이스", "핫도그", "아이스크림", "치즈", "빡코딩",
                               "빡코딩", "오늘도 빡코딩"]
        var labels = [UILabel]()
        
        popularKeyWords.forEach { keyword in
            let keywordLabel = UILabel().then {
                $0.text = keyword
                $0.textColor = UIColor().tagViewTextColor
                $0.font = .systemFont(ofSize: 15)
            }
            
            labels.append(keywordLabel)
        }
        
        let popularKeywordsStackView = UIStackView().then { (stackView) in
            stackView.addArrangedSubview(popularLabel)
            
            labels.forEach { (label) in
                stackView.addArrangedSubview(label)
            }
            
            stackView.spacing = 10
            stackView.axis = .vertical
            stackView.alignment = .leading
            stackView.distribution = .fill
        }
        
        popularLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
        }
        
        
        // MARK: - Create Search Container View
        
        let searchContainerView = UIView().then {
            $0.addSubview(searchButton)
            $0.addSubview(searchTextField)
            $0.addSubview(recommendationStackView)
            $0.addSubview(popularKeywordsStackView)
            
            $0.backgroundColor = UIColor().searchViewBackgroundColor
            $0.layer.cornerRadius = 6
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(20)
            $0.leading.equalToSuperview().offset(13)
        }
        
        searchTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(searchButton.snp.trailing).offset(8)
        }
        
        recommendationStackView.snp.makeConstraints {
            $0.top.equalTo(searchContainerView.snp.bottom).offset(24)
            $0.horizontalEdges.equalToSuperview()
        }
        
        popularKeywordsStackView.snp.makeConstraints {
            $0.top.equalTo(recommendationStackView.snp.bottom).offset(24)
            $0.horizontalEdges.equalToSuperview()
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
