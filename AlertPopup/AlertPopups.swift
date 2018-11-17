//
//  AlertPopups.swift
//  AlertPopup
//
//  Created by edge on 16/11/2018.
//  Copyright © 2018 edge. All rights reserved.
//

import UIKit

class TextOnlyPopup {
    private let innerViewController : InnerTextViewController! = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertInnerView_TextOnly") as? InnerTextViewController
    private let alertViewController : AlertViewController! = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertView_Base") as? AlertViewController
    
    private var buttons : [UIButton] = []
    
    private var isPopupLoaded = false
    public var viewController : AlertViewController {
        get {
            if !self.isPopupLoaded {
                self.alertViewController.setInnerViewController(viewController: self.innerViewController)
                self.alertViewController.setButtons(self.buttons)
                self.isPopupLoaded = true
            }
            
            return self.alertViewController
        }
    }
    
    public var cornerRadius : CGFloat {
        get {
            self.alertViewController.loadViewIfNeeded()
            return self.alertViewController.innerViewContainer.layer.cornerRadius
        }
        
        set {
            self.alertViewController.loadViewIfNeeded()
            self.alertViewController.alertView.layer.cornerRadius = newValue;
            self.alertViewController.alertView.clipsToBounds = true//.layer.masksToBounds = true;
        }
    }
    public var titleText : String? {
        get {
            self.alertViewController.loadViewIfNeeded()
            return self.alertViewController.titleLabel.text
        }
        
        set {
            self.alertViewController.loadViewIfNeeded()
            return self.alertViewController.titleLabel.text = newValue
        }
    }
    
    public var innerText : String? {
        get {
            self.innerViewController.loadViewIfNeeded()
            return self.innerViewController.contentsText.text
        }
        
        set {
            self.innerViewController.loadViewIfNeeded()
            self.innerViewController.contentsText.text = newValue
        }
    }

    // TODO : add method to be able to apply style
    public func addButton(title : String, _ completion : @escaping ()->() = {}) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.addAction(for: .touchUpInside, completion)
        self.buttons.append(button)
    }
}

struct ButtonStyle {
    var titleText : String
    var titleColor : UIColor
    var backgroundColor : UIColor
    var fontName : String
    var fontSize : Double
}
