//
//  AlertPopups.swift
//  AlertPopup
//
//  Created by edge on 16/11/2018.
//  Copyright © 2018 edge. All rights reserved.
//

import UIKit

class TextOnlyPopup {
    public var innerViewController : InnerTextViewController! = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertInnerView_TextOnly") as? InnerTextViewController
    public var alertViewController : AlertViewController! = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertView_Base") as? AlertViewController
    
    public func createPopup() {
        if let innerVC = self.innerViewController {
            innerVC.loadViewIfNeeded()
            innerVC.contentsText.text = "a\nb\nc\nd\na\nb\nc\nd\n"
            alertViewController.setInnerViewController(viewController: innerVC)
        } else {
            print("vc is not inner view")
        }
    }
    
    public func addButton(title : String, _ completion : @escaping ()->() = {}) {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.init(displayP3Red: 1, green: 33/255, blue: 33/255, alpha: 1)
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addAction(for: .touchUpInside, completion)
        
        self.alertViewController.setButton(button)
    }
}
