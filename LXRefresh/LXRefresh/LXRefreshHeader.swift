//
// Created by Bruce Jackson on 2019-01-07.
// Copyright (c) 2019 zysios. All rights reserved.
//

import UIKit

private let contentOffsetKeyPath = "contentOffset"

class LXRefreshHeader: UIView, LXRefresh {
    weak var scrollView: UIScrollView? = nil {
        didSet {
            if let theScrollView = scrollView {
                rawContentInset = theScrollView.contentInset
            } else {
                rawContentInset = .zero
                removeObserver(self, forKeyPath: contentOffsetKeyPath)
            }
        }
    }

    private(set) var rawContentInset: UIEdgeInsets = .zero

    var refreshingHandler: LXVoidBlock? = nil

    private(set) var state: LXRefreshSate = .Idle

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    func setupView() {

    }

    func beginRefresh() {
        state = .Refreshing
    }

    func endRefresh() {

    }
}
