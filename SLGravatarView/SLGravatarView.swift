//
//  SLGravatarView.swift
//
//  Created by Steven Lu on 7/22/15.
//  Copyright (c) 2015 Steven Lu. All rights reserved.
//

import UIKit
import Haneke

class SLGravatarView: UIView {

    var initialsLabelView: UILabel?
    var profilePhoto: UIImageView?

    var initials: String? {
        didSet {
            initialsLabelView?.text = initials
        }
    }

    var email: String? {
        didSet {
            getImage()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        var circleView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        circleView.layer.cornerRadius = frame.width / 2;
        circleView.backgroundColor = UIColor.flatBlackColor()
        addSubview(circleView)

        initialsLabelView = UILabel(frame: CGRect(x: 0, y: frame.height / 7 * 2, width: frame.width, height: frame.height / 7 * 3))
        initialsLabelView?.font = UIFont.primaryFontLightWithSize(frame.height / 7 * 3)
        initialsLabelView?.textColor = UIColor.whiteColor()
        initialsLabelView?.textAlignment = NSTextAlignment.Center
        addSubview(initialsLabelView!)

        profilePhoto = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        profilePhoto?.layer.cornerRadius = frame.width / 2
        profilePhoto?.clipsToBounds = true
        addSubview(profilePhoto!)
    }

    func getImage() {
        profilePhoto?.image = nil
        var url = NSURL(string: "http://www.gravatar.com/avatar/" + hash(email!) + ".jpg?s=400&d=404")
        profilePhoto?.hnk_setImageFromURL(url!)
    }

    func hash(string: String) -> String {
        let str = string.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CC_LONG(string.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)

        CC_MD5(str!, strLen, result)

        var hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }

        result.dealloc(digestLen)

        return hash as String
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}