//
//  SPlashController.swift
//  StockDemo
//
//  Created by Sahid Reza on 27/06/21.
//

import UIKit
import CLTypingLabel

class SPlashController: UIViewController {
    
    @IBOutlet weak var applicationNameLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        updateUI()
        applicationNameLabel.text = K.applicationName
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

//MARK: - Next Controller Function

extension SPlashController{
    
    private func updateUI(){
        
        perform(#selector(gotoNextController),with: nil, afterDelay: 3)

    }
    
    @objc func gotoNextController(){
        
    performSegue(withIdentifier: K.SegueDetails.splashToStockConterller, sender: self)
        
    }
    
}


