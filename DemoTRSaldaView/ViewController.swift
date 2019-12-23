//
//  ViewController.swift
//  DemoTRSaldaView
//
//  Created by omur olgunay on 13.12.2019.
//  Copyright © 2019 AppSome. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let alert = TRSaldaViewAlertController(title: "Title Here", message: "Message Here", preferredStyle: .alert)
        self.present(alert,animated: true)
    }

}

