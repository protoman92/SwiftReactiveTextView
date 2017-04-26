//
//  UIReactiveTextField.swift
//  SwiftReactiveTextField
//
//  Created by Hai Pham on 4/26/17.
//  Copyright © 2017 Swiften. All rights reserved.
//

import RxSwift
import RxCocoa
import SwiftUIUtilities
import SwiftUtilities
import UIKit

/// Thin wrapper for UITextField that supports listening to programmatic
/// text changes.
open class UIReactiveTextField: UITextField {
    fileprivate let textValue = BehaviorSubject<String?>(value: nil)
    
    override open var text: String? {
        get { return super.text }
        
        set {
            super.text = newValue
            textValue.onNext(newValue)
        }
    }
}

extension UIReactiveTextField: InputFieldType {
    open var rxText: Observable<String?> {
        return textValue.asObservable()
    }
    
    /// There is no separate placeholderView, we return the current
    /// UITextField.
    open var placeholderView: UIView? {
        return self
    }
    
    /// Set attributed text.
    open var placeholderTextColor: UIColor? {
        // Nothing of interest here.
        get { return nil }
        
        // We need to set attributedPlaceholder. This is the best way to
        // change text color for this property.
        set {
            guard let color = newValue, let text = self.placeholder else {
                return
            }
            
            let attributes = [NSForegroundColorAttributeName: color]
            let str = NSAttributedString(string: text, attributes: attributes)
            attributedPlaceholder = str
        }
    }
}
