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
        popup.cornerRadius = 5
        popup.titleText = "알림"
        popup.innerText = """
        키스의 고유 조건은 입술끼리 만나야 하고 특별한 기술은 필요치 않다.
        다람쥐 헌 쳇바퀴에 타고파
        """
        
        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(UIColor.white, for: .normal)
        cancelButton.backgroundColor = UIColor(displayP3Red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        
        cancelButton.addAction(for: .touchUpInside) {
            popup.viewController.dismiss(animated: true, completion: {
                print("dismissed!")
            })
        }
        
        let confirmButton = UIButton(type: .system)
        confirmButton.setTitle("확인", for: .normal)
        confirmButton.setTitleColor(UIColor.white, for: .normal)
        confirmButton.backgroundColor = UIColor(displayP3Red: 1, green: 33/255, blue: 33/255, alpha: 1)
        
        confirmButton.addAction(for: .touchUpInside) {
            print("comfirmed")
        }
        
        popup.addButton(with: [cancelButton, confirmButton])
        
        self.present(popup.viewController, animated: true) {
            //
        }
    }
}

