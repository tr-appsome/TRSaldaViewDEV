//
//  TRSaldaViewController.swift
//
//
//  Created by Kerim Çağlar on 5.12.2019.
//

import UIKit

public enum TRActionStyle: Int {
    case `default`
    case cancel
    case destructive
}

public enum TRControllerStyle: Int {
    case alert
    case actionSheet
}

@available(iOS 9.0, *)
class TRSaldaViewAlertController: UIViewController {

     init(title: String, message: String, preferredStyle: TRControllerStyle) {
        self.alertTitle = title
        self.message = message
        self.preferredStyle = preferredStyle
        super.init(nibName: nil, bundle: nil)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private enum Constants {
        enum UI {
            static let containerViewBgColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.4030126284)
            static let containerViewCornerRadius: CGFloat  = 5
            static let topStackViewSpacing: CGFloat = 5
        }
        enum Constraint {
            static let topScrollViewMarginTop: CGFloat = 10
            static let containerViewWidthLeftAndRightMargin: CGFloat = -50
            static let titleAndMessageLabelRightAndLeftMargin: CGFloat = 10
        }
    }
    
    var preferredStyle: TRControllerStyle
    var isAlert: Bool { return preferredStyle == TRControllerStyle.alert } //.alert de denebilir; false değerinde actionSheet olacak
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.UI.containerViewBgColor
        view.layer.cornerRadius = Constants.UI.containerViewCornerRadius
        return view
    }()
    
    var cornerRadius:CGFloat = 15 {
        didSet{
            containerView.layer.cornerRadius = self.cornerRadius
        }
    }
    
    //Alert componentinin oval olup olmayacağını ayarlar
    var hasRoundedCorners = true {
        didSet{
            if hasRoundedCorners {
                containerView.layer.cornerRadius = self.cornerRadius
            } else {
                containerView.layer.cornerRadius = 0
            }
        }
    }

    private lazy var topScrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.autoresizingMask = .flexibleHeight
        view.frame = self.view.bounds
        view.showsHorizontalScrollIndicator = true
        view.bounces = true
        return view
    }()
    
    private lazy var topStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = Constants.UI.topStackViewSpacing
        view.alignment = .fill
        return view
    }()
    
    var topStackViewBgColor = UIColor.black {
        didSet{
            topStackView.backgroundColor = topStackViewBgColor
        }
    }
    
    //MARK: Title
    var alertTitle: String?
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = self.alertTitle
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    var titleFont = UIFont(name: "jeneric_fontlar", size: 15) {
        didSet {
            titleLabel.font = self.titleFont
        }
    }
    
    var titleTextColor = UIColor.black {
        didSet {
            titleLabel.textColor = self.titleTextColor
        }
    }
    
    //MARK: Message
    var message:String?
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = message
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    var messageFont = UIFont(name:"jeneric_fontlar", size:18) {
        didSet {
            messageLabel.font = self.messageFont
        }
    }
    
    var messageTextColor = UIColor.black {
        didSet{
            messageLabel.textColor = self.messageTextColor
        }
    }
    
    //MARK: Setup Alert
    private func setup() {
        self.modalPresentationStyle = .overFullScreen
        view.addSubview(containerView)
        containerView.addSubview(topScrollView)
        topScrollView.addSubview(topStackView)
    
        topStackView.addArrangedSubview(titleLabel)
        topStackView.addArrangedSubview(messageLabel)
        
        makeConstraint()
    }

    private func makeConstraint() {
        enableAutoLayout([titleLabel,messageLabel,topScrollView,topStackView,containerView])
        
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(lessThanOrEqualTo: self.view.widthAnchor, constant: Constants.Constraint.containerViewWidthLeftAndRightMargin),
//            containerView.heightAnchor.constraint(lessThanOrEqualTo: topStackView.heightAnchor, constant: Constants.Constraint.topScrollViewMarginTop * 2),
            containerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: Constants.Constraint.topScrollViewMarginTop * -4),
            containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),

            topScrollView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.Constraint.topScrollViewMarginTop),
            topScrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            topScrollView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            topScrollView.leftAnchor.constraint(equalTo: containerView.leftAnchor),

            topStackView.leadingAnchor.constraint(equalTo: topScrollView.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: topScrollView.trailingAnchor),
            topStackView.topAnchor.constraint(equalTo: topScrollView.topAnchor),
            topStackView.bottomAnchor.constraint(equalTo: topScrollView.bottomAnchor),
            topStackView.widthAnchor.constraint(equalTo: topScrollView.widthAnchor),

            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor,constant: -Constants.Constraint.titleAndMessageLabelRightAndLeftMargin),
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor,constant: Constants.Constraint.titleAndMessageLabelRightAndLeftMargin),
        
            messageLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor,constant: -Constants.Constraint.titleAndMessageLabelRightAndLeftMargin),
            messageLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor,constant: Constants.Constraint.titleAndMessageLabelRightAndLeftMargin)
        ])
        
    }
    
    private func enableAutoLayout(_ views: [UIView]) {
        _ = views.map{ $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}
