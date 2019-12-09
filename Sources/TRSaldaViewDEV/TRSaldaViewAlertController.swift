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

///UIAlertController(title: title, message: message, preferredStyle: .alert)
//MARK: butonlar ile mesaj arasına çizgi konulmalı -> seperator -- divider
//MARK: butonlara font/renk tanımlaması yapılmalı
//MARK: alertView cornerRadius olmalı mı?
//MARK: icon eklenebilmeli
//MARK: gradient seçeneği olmalı (ton geçiş değerleri belirlenebilmeli)
//MARK: animasyon seçeneği olmalı
//MARK: textField seçeneği koyalım
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
    
    // Constant Enum
    private enum Constants {
        enum UI {
            static let containerViewBgColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.4030126284)
            static let containerViewCornerRadius: CGFloat  = 5
        }
        enum Constraint {
            static let topStackViewSpacing: CGFloat = 5
            static let topScrollViewMarginTop: CGFloat = 10
            static let containerViewWidthLeftAndRightMargin: CGFloat = -50
            static let titleAndMessageLabelRightAndLeftMargin: CGFloat = 10
        }
    }
    
    ///prefferedStyle ayarlaması
    var preferredStyle: TRControllerStyle
    var isAlert: Bool { return preferredStyle == TRControllerStyle.alert } //.alert de denebilir; false değerinde actionSheet olacak
    
    /// Tüm alert alanını kapsayacak yer
    var containerView = UIView()
    var containerViewWidth:CGFloat = 250
    
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
    
    var alertBgColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.0) {
        didSet {
            containerView.backgroundColor = alertBgColor
        }
    }

    ///Eklenecek butonlar OK, CANCEL gibi
    var buttonView = UIStackView() //iOS 9 desteği gerekiyor
    var actions: [TRActionStyle] = []
    var defaultButton = UIButton()
    
    var buttons = [UIButton]()
    var cancelTag = 0

    var topStackView = UIStackView()
    var topScrollView = UIScrollView()

    var topStackViewBgColor = UIColor.black {
        didSet{
            topStackView.backgroundColor = topStackViewBgColor
        }
    }
    
    //MARK: Title Options
    var titleLabel = UILabel()
    var alertTitle: String?

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
    
    //MARK: Message Options
    var messageLabel = UILabel()
    var message:String?
    
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
    func setup() {
        self.modalPresentationStyle = .overFullScreen

        //MARK - Configure ContainerView
        containerView.backgroundColor = Constants.UI.containerViewBgColor
        containerView.layer.cornerRadius = Constants.UI.containerViewCornerRadius
        
        //MARK - Configure Title And Message Label
        titleLabel.text = alertTitle
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
    
        //MARK - Top ScrollView
        topScrollView.frame = .zero
        topScrollView.contentSize = CGSize(width: 0, height: 0)
        
        //MARK - Top StackView - Messsage and Title
        topStackView.axis = .vertical
        topStackView.distribution = .equalSpacing
        topStackView.spacing = Constants.Constraint.topStackViewSpacing
        
        topStackView.addArrangedSubview(titleLabel)
        topStackView.addArrangedSubview(messageLabel)
        
        topScrollView.addSubview(topStackView)
        containerView.addSubview(topScrollView)
        view.addSubview(containerView)
        makeConstraint()
    }
    
    func makeConstraint() {
        containerView.translatesAutoresizingMaskIntoConstraints = false // Activate the autoLayout
        topScrollView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(lessThanOrEqualTo: self.view.widthAnchor, constant: Constants.Constraint.containerViewWidthLeftAndRightMargin),
            containerView.heightAnchor.constraint(equalTo: topStackView.heightAnchor, constant: Constants.Constraint.topScrollViewMarginTop * 2),//TODO: Calculate height
            containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            topScrollView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.Constraint.topScrollViewMarginTop),
            topScrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            topScrollView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            topScrollView.leftAnchor.constraint(equalTo: containerView.leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            topStackView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            topStackView.leftAnchor.constraint(equalTo: containerView.leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor,constant: -Constants.Constraint.titleAndMessageLabelRightAndLeftMargin),
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor,constant: Constants.Constraint.titleAndMessageLabelRightAndLeftMargin)
        ])
        
        NSLayoutConstraint.activate([
            messageLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor,constant: -Constants.Constraint.titleAndMessageLabelRightAndLeftMargin),
            messageLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor,constant: Constants.Constraint.titleAndMessageLabelRightAndLeftMargin)
        ])
    }
}
