//
//  EventController.swift
//  EasyComponents_Example
//
//  Created by 范晓鑫 on 2021/2/11.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import EasyComponents

class EventController: UIViewController {
    
//    let waitEvent = EasyOnceEvent()
    static var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "事件处理"
        
        print("EventController viewDidLoad")
        
        let waitButton = UIButton.easy(.text("添加等待事件"), .color(.systemBlue), .event(self, #selector(self.wait)))
        let trigerButton = UIButton.easy(.text("事件准备完成"), .color(.systemRed), .event(self, #selector(self.ready)))
        
        self.view.easy.style(.bg(.white))
            .add(waitButton, layout: .top(UIView.easy.safeArea.top + 44 + 30), .centerX)
            .next(trigerButton, layout: .bottomTop(20), .centerX)
    }
    @objc func ready() {
//        self.waitEvent()
    }
    @objc func wait() {
//        self.waitEvent.add {
//            print("waiting...\(Self.flag)")
//            Self.flag += 1
//        }
    }
}
