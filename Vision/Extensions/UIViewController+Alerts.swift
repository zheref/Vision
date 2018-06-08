//
//  UIViewController+Vision.swift
//  Vision
//
//  Created by Sergio Lozano García on 6/6/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

import Foundation

// MARK: - Public types

public enum VisionRetryKey : Hashable {
    case style
    case retryCopy
    case cancelCopy
    case animated
    case presentationCompletion
}

public typealias VisionRetryOptions = [VisionRetryKey: Any]

// MARK: - Private types

struct VisionRetryConstants {
    static let defaultRetryCopy = "Retry"
    static let defaultCancelCopy = "Cancel"
    static let defaultStyle = UIAlertControllerStyle.alert
    static let defaultAnimated = true
    static let defaultPresentationCompletion: VisionHandler? = nil
}

// MARK: - Extension

public extension UIViewController {
    
    // MARK: Alerts
    
    func showRetryAlert(withTitle title: String,
                        message: String,
                        retryHandler retry: @escaping VisionHandler,
                        cancelHandler cancel: VisionHandler? = nil,
                        options: VisionRetryOptions? = nil) {
        
        // Alert
        
        let popupStyle = options?[.style] as? UIAlertControllerStyle ??
            VisionRetryConstants.defaultStyle
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: popupStyle)
        
        // Retry action
        
        let retryTitle = options?[.retryCopy] as? String ?? VisionRetryConstants.defaultRetryCopy
        let retryHandler: (UIAlertAction) -> Void = { (action) in retry() }
        let retryAction = UIAlertAction(title: retryTitle,
                                        style: .default,
                                        handler: retryHandler)
        alert.addAction(retryAction)
        
        // Cancel action
        
        if let cancel = cancel {
            let cancelTitle = options?[.cancelCopy] as? String ??
                VisionRetryConstants.defaultCancelCopy
            let cancelHandler: (UIAlertAction) -> Void = { (action) in cancel() }
            let cancelAction = UIAlertAction(title: cancelTitle,
                                             style: .cancel,
                                             handler: cancelHandler)
            alert.addAction(cancelAction)
        }
        
        // Presentation
        
        let animated = options?[.animated] as? Bool ?? VisionRetryConstants.defaultAnimated
        let completion = options?[.presentationCompletion] as? VisionHandler ??
            VisionRetryConstants.defaultPresentationCompletion
        
        present(alert, animated: animated, completion: completion)
    }
    
}
