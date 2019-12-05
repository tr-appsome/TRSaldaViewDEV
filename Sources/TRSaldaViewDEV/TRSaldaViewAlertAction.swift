//
//  TRSaldaViewAlertAction.swift
//  
//
//  Created by Kerim Çağlar on 5.12.2019.
//

import UIKit

public class TRAlertAction:NSObject {
    
    var title: String?
    var bgColor: UIColor?
    var style: TRActionStyle
    var handler: ((TRAlertAction) -> Void)? = nil
    var isEnabled: Bool
    
    public init(title: String?, bgColor: UIColor?, style: TRActionStyle, handler: ((TRAlertAction) -> Void)? = nil){
        self.title = title
        self.bgColor = bgColor
        self.style = style
        self.handler = handler
        self.isEnabled = true
    }

}
