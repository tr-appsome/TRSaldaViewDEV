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
//MARK: butonlar ile mesaj arasına çizgi konulmalı
//MARK: butonlara font/renk tanımlaması yapılmalı
@available(iOS 9.0, *)
struct TRSaldaViewAlertController {
    
    ///prefferedStyle ayarlaması
    var preferredStyle: TRControllerStyle
    var isAlert: Bool { return preferredStyle == TRControllerStyle.alert } //.alert de denebilir; false değerinde actionSheet olacak
    
    ///Mesaj için gerekli ayarlamalar
    var messageView = UIView()
    var messageLabel = UILabel()
    var message:String!
    var messageFont = UIFont(name:"jeneric_fontlar", size:18) {
        didSet {
            messageLabel.font = messageFont
        }
    }
    var messageTextColor = UIColor.black {
        didSet{
            messageLabel.textColor = messageTextColor
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
    var titleLabel = UILabel()
    var titleFont = UIFont(name: "jeneric_fontlar", size: 15) {
        didSet {
            titleLabel.font = titleFont
        }
    }
    var titleTextColor = UIColor.black {
        didSet {
            titleLabel.textColor = titleTextColor
        }
    }

}
