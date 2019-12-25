//
//  ConstantProtocol.swift
//  TRSaldaViewDEV
//
//  Created by kerimcaglar on 25.12.2019.
//

import UIKit

protocol TRSaldaViewProtocol {
    func showMessage(title:String?, message:String?, type:TRToastType, settings: TRToastSettings)
    func hideMessage(animated:Bool)
}
