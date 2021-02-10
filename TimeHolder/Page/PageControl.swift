//
//  PageControl.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/9.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    typealias UIViewType = UIPageControl
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let uiPageControl = UIPageControl()
        uiPageControl.numberOfPages = numberOfPages
        uiPageControl.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        return uiPageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator:NSObject{
        var control: PageControl
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
