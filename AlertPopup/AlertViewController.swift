//
//  AlertViewController.swift
//  AlertPopup
//
//  Created by edge on 15/11/2018.
//  Copyright © 2018 edge. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var innerViewContainer: UIView!
    @IBOutlet weak var buttonStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func setInnerViewController(viewController: UIViewController) {
        self.addChild(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
    
        self.innerViewContainer.addSubview(viewController.view)
        NSLayoutConstraint.activate([
            viewController.view.leadingAnchor.constraint(equalTo: self.innerViewContainer.leadingAnchor, constant: 0),
            viewController.view.trailingAnchor.constraint(equalTo: self.innerViewContainer.trailingAnchor, constant: 0),
            viewController.view.topAnchor.constraint(equalTo: self.innerViewContainer.topAnchor, constant: 0),
            viewController.view.bottomAnchor.constraint(equalTo: self.innerViewContainer.bottomAnchor, constant: 0)
        ])
    
        viewController.didMove(toParent: self)
    }
    
    public func setButton(_ button : UIButton) {
        self.buttonStackView.addArrangedSubview(button)
    }
    
    public func setButtons(_ buttons : [UIButton]) {
        for button in buttons {
            self.setButton(button)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
