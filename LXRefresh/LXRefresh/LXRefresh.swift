//
//  LXRefresh.swift
//  LXRefresh
//
//  Created by Bruce Jackson on 2019/1/6.
//  Copyright © 2019 zysios. All rights reserved.
//

import UIKit

public typealias LXVoidBlock = () -> ()

public enum LXRefreshSate {
    case Idle
    case Pulling
    case Critical
    case Refreshing
}

public protocol LXRefresh {
    var scrollView: UIScrollView? { get }

    var rawContentInset: UIEdgeInsets { get }
    
    var criticalPercent: CGFloat { get }
    
    var state: LXRefreshSate { get }
    
    var refreshingHandler: LXVoidBlock? { get set }
    
    func setupView()
    
    func beginRefresh()
    
    func endRefresh()
}

public extension LXRefresh where Self: UIView {
    var criticalPercent: CGFloat {
        return self.frame.height / CGFloat(2.0)
    }
    
    var state: LXRefreshSate {
        return .Idle
    }
}
