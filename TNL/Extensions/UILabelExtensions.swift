//
//  UILabelExtensions.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 26/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import UIKit

extension UILabel {
  func addImage(attribText: NSAttributedString, imageName: String)
  {
     
        //Create Attachment
        let imageAttachment =  NSTextAttachment()
        imageAttachment.image = UIImage(named: imageName)
        //Set bound to reposition
        let imageOffsetY:CGFloat = -4.0;
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        //Create string with attachment
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        //Initialize mutable string
        let completeText = NSMutableAttributedString(string: "")
        //Add image to mutable string
        completeText.append(attachmentString)
        //Add your text to mutable string
        let  textAfterIcon = attribText
        completeText.append(textAfterIcon)
        
        self.textAlignment = .center;
        self.attributedText = completeText;
      }
  
  }

