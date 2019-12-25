//
//  TRSaldaViewToastController.swift
//  TRSaldaViewDEV
//
//  Created by kerimcaglar on 25.12.2019.
//

import UIKit
import TinyConstraints

public enum TRToastType
{
    case success
    case error
    case warning
    case info
}

public enum TRToastPosition
{
    case top
    case center
    case bottom
}

public enum TRToastAnimation
{
    case fade //başka animasyonlar eklenmeli
}

public enum TRToastSettings
{
    case duration(TimeInterval)
    case position(TRToastPosition)
    case textColor(UIColor)
    case textNumberOfLines(Int)
    case padding(UIEdgeInsets)
    case margin(UIEdgeInsets)
    case animation(TRToastAnimation) //Animasyonlar arttırılmalı
}

class TRSaldaViewToastController: UIViewController, TRSaldaViewProtocol {
            
    //    MARK: Alert den kopyaladım, kod tekrarını kaldırmalıyız
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
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.UI.containerViewBgColor
        view.layer.cornerRadius = Constants.UI.containerViewCornerRadius
        return view
    }()
    
    var message:String?
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = message
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    func showMessage(title: String?, message: String?, type: TRToastType, settings: TRToastSettings) {
//        TODO
    }
    
    func hideMessage(animated:Bool = true) {
//        TODO
    }
}
