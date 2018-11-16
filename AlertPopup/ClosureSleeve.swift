//
//  ClosureSleeve.swift
//  AlertPopup
//
//  Created by edge on 16/11/2018.
//  Copyright © 2018 edge. All rights reserved.
//

import UIKit

/*
 https://stackoverflow.com/questions/25919472/adding-a-closure-as-target-to-a-uibutton
 from aepryus, Kiran Jasvanee
 */

class ClosureSleeve {
    let closure: ()->()
    
    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}

// Adding a closure as target to UIButton
extension UIControl {
    func addAction(for controlEvents: UIControl.Event, _ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
