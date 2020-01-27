//
//  StringExtensions.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 24/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import UIKit

extension String {
  
  var html2AttributedString: NSAttributedString? {
    do {
      return try NSAttributedString(
        data: Data(utf8),
        options: [
          .documentType: NSAttributedString.DocumentType.html,
          .characterEncoding: String.Encoding.utf8.rawValue
        ],
        documentAttributes: nil
      )
    } catch {
      print("error: ", error)
      return nil
    }
  }
  
  func isValidEmail() -> Bool {
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: self)
  }
  
  func leftPadding(toLength: Int, withPad character: Character) -> String {
      let newLength = self.count
      if newLength < toLength {
          return String(repeatElement(character, count: toLength - newLength)) + self
      } else {
          return self.substring(from: index(self.startIndex, offsetBy: newLength - toLength))
      }
  }
}

extension NSMutableAttributedString {
    func replaceFont(with font: UIFont) {
        beginEditing()
        self.enumerateAttribute(.font, in: NSRange(location: 0, length: self.length)) { (value, range, stop) in
            if let f = value as? UIFont {
                let ufd = f.fontDescriptor.withFamily(font.familyName).withSymbolicTraits(f.fontDescriptor.symbolicTraits)!
                let newFont = UIFont(descriptor: ufd, size: font.pointSize)
                removeAttribute(.font, range: range)
                addAttribute(.font, value: newFont, range: range)
            }
        }
        endEditing()
    }
  
      
  
}
