//
//  OnboardViewController.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/18/22.
//

import UIKit
import UIComponents
import TinyConstraints
import MobilliumBuilders
final class OnboardViewController: BaseViewController<OnboardViewModel> {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.register(OnboardCell.self)
        return collectionView
    }()
    
    private lazy var pageControl = UIPageControlBuilder()
        .currentPageIndicatorTintColor(AppConstants.Style.Color.orange)
        .pageIndicatorTintColor(AppConstants.Style.Color.gray)
        .numberOfPages(4)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.didLoad()
        addSubViews()
    }
}

// MARK: - UILayout
extension OnboardViewController {
    
    private func addSubViews() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview()
        addPageControl()
    }
    
    private func addPageControl() {
        view.addSubview(pageControl)
        pageControl.bottomToSuperview()
        pageControl.centerXToSuperview()
    }
}


// MARK: - UICollectionViewDelegate
extension OnboardViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if pageControl.currentPage == indexPath.row {
            pageControl.currentPage = collectionView.indexPath(for: collectionView.visibleCells.first!)!.row
        }
    }
}

// MARK: - UICollectionViewDataSource
extension OnboardViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OnboardCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.delegate = self
        cell.set(viewModel: cellItem)
        return cell
    }
}

// swiftlint:disable line_length
// MARK: - UICollectionViewDelegateFlowLayout
extension OnboardViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = collectionView.frame
        return .init(width: frame.width, height: frame.height)
    }
    
}
// swiftlint:enable line_length

// MARK: -
extension OnboardViewController: OnboardCellDelegate {
    
    func continueButtonTapped() {
        viewModel.presentMainTabBar()
    }
}
