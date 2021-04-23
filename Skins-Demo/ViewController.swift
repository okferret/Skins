//
//  ViewController.swift
//  Skins-Demo
//
//  Created by tramp on 2021/4/23.
//

import UIKit
import Skins

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.skin.backgroundColor = .major
        view.layer.skin.borderColor = .major
        view.layer.skin.backgroundColor = .major
        view.layer.skin.shadowColor = .major
        view.layer.skin.shadowColor = .major
        Skins.shared.log()
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
   
        guard presentingViewController == nil else { return }
        let controller = ViewController.init()
        present(controller, animated: true, completion: nil)
    }
    
    deinit {
        print(#function)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            Skins.shared.log()
        }
    }
}

