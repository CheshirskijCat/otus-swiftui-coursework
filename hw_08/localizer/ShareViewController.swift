//
//  ShareViewController.swift
//  localizer
//
//  Created by Dmitry Dementyev on 15.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        guard let text = textView.text else {return}
        guard let sharedDefaults = UserDefaults(suiteName: "group.otus.swiftui.localizer") else { return }
        sharedDefaults.set(text, forKey: "shareText")
        let result = self.openURL(URL(string: "localizeURL://LocalizerView")!)
        print(result)
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }
    
    @objc func openURL(_ url: URL) -> Bool {
        var responder: UIResponder? = self
        while responder != nil {
            if let application = responder as? UIApplication {
                return application.perform(#selector(openURL(_:)), with: url) != nil
            }
            responder = responder?.next
        }
        return false
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}


