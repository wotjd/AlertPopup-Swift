//
//  ViewController.swift
//  AlertPopup
//
//  Created by edge on 15/11/2018.
//  Copyright © 2018 edge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onButton(_ sender: Any) {
        let popup = TextOnlyPopup()
        popup.cornerRadius = 7.5
        popup.titleText = "알림"
        popup.innerText = """
        키스의 고유 조건은 입술끼리 만나야 하고 특별한 기술은 필요치 않다.
        다람쥐 헌 쳇바퀴에 타고파
        """
        
        popup.addButton(title: "취소") {
            popup.viewController.dismiss(animated: true, completion: {
                print("dismissed!")
            })
        }
        
        popup.addButton(title: "확인") {
            print("confirmed")
        }
        
        self.present(popup.viewController, animated: true) {
            //
        }
    }
}

