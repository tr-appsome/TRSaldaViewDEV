//
//  TRSaldaViewController.swift
//
//
//  Created by Kerim Çağlar on 5.12.2019.
//

import UIKit
import TinyConstraints

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
class TRSaldaViewAlertController {
    
    init(title: String, message: String, preferredStyle: TRControllerStyle) {
        self.title = title
        self.message = message
        self.preferredStyle = preferredStyle
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
    
    ///Mesaj için gerekli ayarlamalar
    var messageView = UIView()
    var messageLabel = UILabel()
    var message:String!
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
    
    ///Eklenecek butonlar OK, CANCEL gibi
    var buttonView = UIStackView() //iOS 9 desteği gerekiyor
    var actions: [TRActionStyle] = []
    var defaultButton = UIButton()
    
    var buttons = [UIButton]()
    var cancelTag = 0
    
    ///Title için gerekli ayarlamalar
    var titleView = UIView()
    let titleViewHeight:CGFloat = 45.0
    
    var titleViewBgColor = UIColor.black {
        didSet{
            titleView.backgroundColor = titleViewBgColor
        }
    }
    var title: String?
    var titleLabel = UILabel(){
        didSet {
            guard let title = title else { return }
            titleLabel.text = title
        }
    }
    
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

}
