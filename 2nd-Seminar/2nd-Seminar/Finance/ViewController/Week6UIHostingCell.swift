//
//  Week6UIHostingCell.swift
//  2nd-Seminar
//
//  Created by MaengKim on 11/29/24.
//
import UIKit
import SwiftUI

import SnapKit

public class Week6UIHostingCell<Content: View>: UITableViewCell {
    
    // MARK: - Properties
    
    private var hostingController = UIHostingController<Content?>(rootView: nil)
    
    // MARK: - Init
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Func
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        hostingController.willMove(toParent: nil)
        hostingController.rootView = nil
        hostingController.removeFromParent()
    }
    
    public func configure(with view: Content, parent: UIViewController) {
        parent.addChild(hostingController)
        hostingController.rootView = view
        hostingController.view.invalidateIntrinsicContentSize()
        hostingController.didMove(toParent: parent)
    }
}
