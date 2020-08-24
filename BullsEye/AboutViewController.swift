//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Maurício de Freitas Sayão on 19/08/20.
//  Copyright © 2020 Maurício de Freitas Sayão. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var aboutWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
           
            aboutWebView.load(request)
        }
    }

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
