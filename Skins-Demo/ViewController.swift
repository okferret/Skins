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
        
        view.skin.backgroundColor = .meduim
        view.layer.skin.borderColor = .major
        view.layer.skin.backgroundColor = .major
        view.layer.skin.shadowColor = .major
        view.layer.skin.shadowColor = .major
        Skins.shared.log()
        
        let button = UIButton.init(type: .custom)
        button.setTitle("fasdfasdfasdf", for: .normal)
        button.skin.setTitleColor(.meduim, for: .normal)
        button.skin.setTitleColor(.foreground, for: .highlighted)
        button.frame = .init(x: 0.0, y: 0.0, width: 100, height: 100)
        button.addTarget(self, action: #selector(actionHandle), for: .touchUpInside)
        view.addSubview(button)
        button.center = view.center
    }
    
    /// actionHandle
    /// - Parameter sender: UIButton
    @objc private func actionHandle(_ sender: UIButton) {
        Skins.shared.change(style: .cool)
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
