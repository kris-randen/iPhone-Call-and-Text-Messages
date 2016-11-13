//
//  ViewController.swift
//  Phone Call and Text
//
//  Created by Kris Rajendren on Nov/12/16.
//  Copyright © 2016 Campus Coach. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBAction func call(_ sender: Any)
    {
        callNumber(phoneNumber: phoneNumberTextField.text!)
    }
    
    @IBAction func text(_ sender: Any)
    {
        sendText(phoneNumber: phoneNumberTextField.text!)
    }
    
    func callNumber(phoneNumber:String)
    {
        if let phoneCallURL:NSURL = NSURL(string: "tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL as URL)) {
                application.openURL(phoneCallURL as URL);
            }
        }
    }
    
    func sendText(phoneNumber: String)
    {
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = ""
            controller.recipients = [phoneNumber]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

