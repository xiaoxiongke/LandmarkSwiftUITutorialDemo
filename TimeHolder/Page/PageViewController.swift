//
//  PageViewController.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/9.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {

    typealias UIViewControllerType = UIPageViewController
    var pages:[Page]
    
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageVC = UIPageViewController(
            transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil
        )
        pageVC.dataSource = context.coordinator
        pageVC.delegate = context.coordinator
        return pageVC
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    class Coordinator:NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map{ UIHostingController(rootView: $0) }
        }
        
        /// UIPageViewControllerDelegate
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let visiableVC = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visiableVC)
               {
                parent.currentPage = index
            }
        }
        
        /// UIPageViewControllerDataSource
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            if index == 0{
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            if index + 1 == controllers.count{
                return controllers.first
            }
            return controllers[index + 1]
        }
        
    }
}
