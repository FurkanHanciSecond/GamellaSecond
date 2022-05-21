//
//  MainOnboard.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/17/22.
//

import UIKit
import Utilities
class MainOnboardPageController: UIPageViewController {
    private var pageControl = UIPageControl()
    
    private lazy var orderedViewControllers : [UIViewController] = {
        let firstOnboardVC = FirstOnboardVC()
        let secondOnboardVC = SecondOnboardVC()
        let thirdOnboardVC = ThirdOnboardVC()
        let fourthOnboardVC = FourthOnboardVC()
        
        return [firstOnboardVC , secondOnboardVC , thirdOnboardVC , fourthOnboardVC]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        self.delegate = self
        configurePageControl()
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
   private func configurePageControl() {
          pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
          self.pageControl.numberOfPages = orderedViewControllers.count
          self.pageControl.currentPage = 0
       self.pageControl.tintColor = .black
       self.pageControl.pageIndicatorTintColor = AppConstants.Style.Color.gray
       self.pageControl.currentPageIndicatorTintColor = AppConstants.Style.Color.orange
          self.view.addSubview(pageControl)
      }
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - PageviewControllerDelegate

extension MainOnboardPageController : UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
         let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.firstIndex(of: pageContentViewController)!
     }
}

// MARK: - PageViewControllerDataSource

extension MainOnboardPageController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
                  return nil
              }
              
              let previousIndex = viewControllerIndex - 1
              
              guard previousIndex >= 0 else {
                  return nil
              }
              
              guard orderedViewControllers.count > previousIndex else {
                  return nil
              }
              
              return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of : viewController) else {
                   return nil
               }
               
               let nextIndex = viewControllerIndex + 1
               let orderedViewControllersCount = orderedViewControllers.count

               guard orderedViewControllersCount != nextIndex else {
                   return nil
               }
               
               guard orderedViewControllersCount > nextIndex else {
                   return nil
               }
               
               return orderedViewControllers[nextIndex]

    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
}



