//
//  AlertCentral.swift
//  Nehao
//
//  Created by Divakar on 12/13/16.
//  Copyright © 2016 Amit Tripathi. All rights reserved.
//

import Foundation
import UIKit


struct AlertCentral {
    static func displayAlert(title:String, message:String, style:UIAlertControllerStyle, actionButtonTitle:[String],completionHandler:@escaping (UIAlertAction)->Void,controller:UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addAction(UIAlertAction(title: actionButtonTitle[0], style: UIAlertActionStyle.default, handler: completionHandler))
        alert.addAction(UIAlertAction(title:  actionButtonTitle[1], style: UIAlertActionStyle.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
        
    }
    static func displayOkAlert(title:String, message:String, style:UIAlertControllerStyle, actionButtonTitle:String,completionHandler:@escaping (UIAlertAction)->Void,controller:UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addAction(UIAlertAction(title: actionButtonTitle, style: UIAlertActionStyle.default, handler: completionHandler))
        controller.present(alert, animated: true, completion: nil)
        
    }
    
    static func displayAlertView(title:String, message:String, style:UIAlertControllerStyle, actionButtonTitle:[String],completionHandler:@escaping (UIAlertAction)->Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addAction(UIAlertAction(title: actionButtonTitle[0], style: UIAlertActionStyle.default, handler: completionHandler))
        // alert.addAction(UIAlertAction(title:  actionButtonTitle[1], style: UIAlertActionStyle.default, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion:{() -> Void in})
    }
    static func displayAlertViewWithCancel(title:String, message:String, style:UIAlertControllerStyle, actionButtonTitle:[String],completionHandler:@escaping (UIAlertAction)->Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addAction(UIAlertAction(title: actionButtonTitle[0], style: UIAlertActionStyle.default, handler: completionHandler))
        alert.addAction(UIAlertAction(title:  actionButtonTitle[1], style: UIAlertActionStyle.default, handler: nil))
        // UIApplication.shared.keyWindow!.rootViewController!.present(alert, animated: true, completion: (Bool) -> Void)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: {() -> Void in})
    }
    static func showAlertWithTitle(with title:String, message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        UIApplication.shared.keyWindow!.rootViewController!.present(alertController, animated: true, completion: {() -> Void in})
    }
    
    static func showViewController(on topVc:UIViewController){
        var vc = UIApplication.shared.keyWindow!.rootViewController!
        while (vc.presentedViewController != nil) {
            vc = vc.presentedViewController!
        }
        vc.present(topVc, animated: true, completion: nil)
    }
    static func showSettingsAlertView(withTitle title: String,body:String,requiredCancelButton:Bool) {
        DispatchQueue.main.async(execute: {() -> Void in
            let alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            })
            let settingsAction = UIAlertAction(title: "Settings", style: .default, handler: {(_ action: UIAlertAction) -> Void in
                let appSettings = URL(string: UIApplicationOpenSettingsURLString)!
                UIApplication.shared.open(appSettings, options: [:], completionHandler: { (granted :Bool) in
                    if granted {
                    } else {
                        
                    }
                })
            })
            if requiredCancelButton {
                alertController.addAction(cancelAction)
            }
            alertController.addAction(settingsAction)
            UIApplication.shared.keyWindow!.rootViewController!.present(alertController, animated: true, completion: {() -> Void in})
        })
    }
    
    static func alert(_ title : String, message : String, view:UIViewController)
    {
        let alert = UIAlertController(title:title, message:  message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
    
}


