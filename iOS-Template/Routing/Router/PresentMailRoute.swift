//
//  PresentMailRoute.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/20/22.
//

import MessageUI

protocol PresentMailRoute {
    func presentMailComposer()
}

extension PresentMailRoute where Self: RouterProtocol {
    
    func presentMailComposer() {
        let transition = ModalTransition()
        
        let recipientEmail = "furkanhanci265@gmail.com"
        let subject = "Hey There!"
        let body = "I love your app keep going!"
        let composer = MFMailComposeViewController()
        composer.setToRecipients([recipientEmail])
        composer.setSubject(subject)
        composer.setMessageBody(body, isHTML: false)
        
        if MFMailComposeViewController.canSendMail() {
            print("yes")
        } else if let emailUrl = createEmailUrl(to: recipientEmail, subject: subject, body: body) {
            UIApplication.shared.open(emailUrl)
        }
        
        open(composer, transition: transition)
    }
    
    private func createEmailUrl(to: String, subject: String, body: String) -> URL? {
        let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let gmailUrl = URL(string: "googlegmail://co?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let outlookUrl = URL(string: "ms-outlook://compose?to=\(to)&subject=\(subjectEncoded)")
        let yahooMail = URL(string: "ymail://mail/compose?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let sparkUrl = URL(string: "readdle-spark://compose?recipient=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let defaultUrl = URL(string: "mailto:\(to)?subject=\(subjectEncoded)&body=\(bodyEncoded)")
        
        if let gmailUrl = gmailUrl, UIApplication.shared.canOpenURL(gmailUrl) {
            return gmailUrl
        } else if let outlookUrl = outlookUrl, UIApplication.shared.canOpenURL(outlookUrl) {
            return outlookUrl
        } else if let yahooMail = yahooMail, UIApplication.shared.canOpenURL(yahooMail) {
            return yahooMail
        } else if let sparkUrl = sparkUrl, UIApplication.shared.canOpenURL(sparkUrl) {
            return sparkUrl
        }
        
        return gmailUrl
    }
}

