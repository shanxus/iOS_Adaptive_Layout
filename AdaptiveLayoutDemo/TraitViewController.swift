//
//  TraitViewController.swift
//  AdaptiveLayoutDemo
//
//  Created by ShanOvO on 2019/11/18.
//  Copyright © 2019 ShanOvO. All rights reserved.
//

import UIKit

class TraitViewController: UIViewController {

    var viewController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Add child view controller.
        viewController = ((UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")) as! ViewController)
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        checkSize()
    }
    
    func checkSize() {
        
        if self.traitCollection.userInterfaceIdiom == .pad {    // If current device is iPad.
            let isPortrait = UIApplication.shared.statusBarOrientation.isPortrait
            if isPortrait { // For portrait orientation.
                let wC = UITraitCollection(horizontalSizeClass: .compact)
                let hR = UITraitCollection(verticalSizeClass: .regular)
                let customTrait = UITraitCollection(traitsFrom: [wC, hR])
                
                setOverrideTraitCollection(customTrait, forChild: viewController)
            } else {    // For landscape orientation.
                
                let bounds = view.bounds
                if bounds.width < bounds.height {
                    let wC = UITraitCollection(horizontalSizeClass: .compact)
                    let hR = UITraitCollection(verticalSizeClass: .regular)
                    let customTrait = UITraitCollection(traitsFrom: [wC, hR])
                    
                    setOverrideTraitCollection(customTrait, forChild: viewController)
                } else {
                    let wR = UITraitCollection(horizontalSizeClass: .regular)
                    let hR = UITraitCollection(verticalSizeClass: .regular)
                    let customTrait = UITraitCollection(traitsFrom: [wR, hR])
                    
                    setOverrideTraitCollection(customTrait, forChild: viewController)
                }
            }
        }
    }
    

}
