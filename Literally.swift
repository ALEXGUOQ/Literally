// Literally.swift
//
// Copyright (c) 2014 Mattt Thompson (http://mattt.me)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

// MARK: - Foundation -

import Foundation

// MARK: NSCharacterSet

extension NSCharacterSet: ArrayLiteralConvertible {
    public class func convertFromArrayLiteral(characters: Character...) -> Self {
        return self(charactersInString: join("", characters.map({String($0)})))
    }
}

extension NSCharacterSet: StringLiteralConvertible {
    typealias ExtendedGraphemeClusterLiteralType = StringLiteralType

    public class func convertFromExtendedGraphemeClusterLiteral(value: StringLiteralType) -> Self {
        return self(charactersInString: value)
    }

    public class func convertFromStringLiteral(value: StringLiteralType) -> Self {
        return self(charactersInString: value)
    }
}

// MARK: NSExpression

extension NSExpression: StringLiteralConvertible {
    typealias ExtendedGraphemeClusterLiteralType = StringLiteralType

    public class func convertFromExtendedGraphemeClusterLiteral(value: StringLiteralType) -> Self {
        return self(format: value, argumentArray: [])
    }

    public class func convertFromStringLiteral(value: StringLiteralType) -> Self {
        return self(format: value, argumentArray: [])
    }
}

// MARK: NSIndexPath

extension NSIndexPath: ArrayLiteralConvertible {
    public class func convertFromArrayLiteral(indexes: Int...) -> Self {
        return self(indexes: indexes, length: indexes.count)
    }
}

// MARK: NSIndexSet

extension NSIndexSet: ArrayLiteralConvertible {
    public class func convertFromArrayLiteral(indexes: Int...) -> Self {
        var mutableIndexSet = NSMutableIndexSet()
        for index in indexes {
            mutableIndexSet.addIndex(index)
        }

        return self(indexSet: mutableIndexSet)
    }
}

// MARK: NSNull

extension NSNull: NilLiteralConvertible {
    public class func convertFromNilLiteral() -> Self {
        return self()
    }
}

// MARK: NSOrderedSet

extension NSOrderedSet: ArrayLiteralConvertible {
    public class func convertFromArrayLiteral(elements: AnyObject...) -> Self {
        return self(array: elements)
    }
}

// MARK: NSPredicate

extension NSPredicate: StringLiteralConvertible {
    typealias ExtendedGraphemeClusterLiteralType = StringLiteralType

    public class func convertFromExtendedGraphemeClusterLiteral(value: StringLiteralType) -> Self {
        return self(format: value, argumentArray: [])
    }

    public class func convertFromStringLiteral(value: StringLiteralType) -> Self {
        return self(format: value, argumentArray: [])
    }
}

// MARK: NSRegularExpression

extension NSRegularExpression: StringLiteralConvertible {
    typealias ExtendedGraphemeClusterLiteralType = StringLiteralType

    public class func convertFromExtendedGraphemeClusterLiteral(value: StringLiteralType) -> Self {
        return self(pattern: value, options: nil, error: nil)
    }

    public class func convertFromStringLiteral(value: StringLiteralType) -> Self {
        return self(pattern: value, options: nil, error: nil)
    }
}

// MARK: NSScanner

extension NSScanner: StringLiteralConvertible {
    typealias ExtendedGraphemeClusterLiteralType = StringLiteralType

    public class func convertFromExtendedGraphemeClusterLiteral(value: StringLiteralType) -> Self {
        return self(string: value)
    }

    public class func convertFromStringLiteral(value: StringLiteralType) -> Self {
        return self(string: value)
    }
}

// MARK: NSSet

extension NSSet: ArrayLiteralConvertible {
    public class func convertFromArrayLiteral(elements: AnyObject...) -> Self {
        return self(array: elements)
    }
}

// MARK: NSTimeZone

extension NSTimeZone: StringLiteralConvertible {
    typealias ExtendedGraphemeClusterLiteralType = StringLiteralType

    public class func convertFromExtendedGraphemeClusterLiteral(value: StringLiteralType) -> Self {
        return self(name: value)
    }

    public class func convertFromStringLiteral(value: StringLiteralType) -> Self {
        return self(name: value)
    }
}

// MARK: NSURL

extension NSURL: StringLiteralConvertible {
    typealias ExtendedGraphemeClusterLiteralType = StringLiteralType

    public class func convertFromExtendedGraphemeClusterLiteral(value: StringLiteralType) -> Self {
        return self(string: value)
    }

    public class func convertFromStringLiteral(value: StringLiteralType) -> Self {
        return self(string: value)
    }
}

// MARK: - UIKit -

#if os(iOS)

import UIKit

// MARK: UIColor

extension UIColor: IntegerLiteralConvertible {
    public class func convertFromIntegerLiteral(value: IntegerLiteralType) -> Self {
        let red = CGFloat((value & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((value & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(value & 0x0000FF) / 255.0
        let alpha = CGFloat(1.0)

        return self(red: red, green: green, blue: blue, alpha: alpha)
    }
}

// MARK: UIImage

extension UIImage: StringLiteralConvertible {
    typealias ExtendedGraphemeClusterLiteralType = StringLiteralType

    public class func convertFromExtendedGraphemeClusterLiteral(value: StringLiteralType) -> Self {
        return self(named: value)
    }

    public class func convertFromStringLiteral(value: StringLiteralType) -> Self {
        return self(named: value)
    }
}

#endif

// MARK: - AppKit -

#if os(OSX)

import Cocoa

extension NSColor: IntegerLiteralConvertible {
    public class func convertFromIntegerLiteral(value: IntegerLiteralType) -> Self {
        let red = CGFloat((value & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((value & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(value & 0x0000FF) / 255.0
        let alpha = CGFloat(1.0)

        return self(red: red, green: green, blue: blue, alpha: alpha)
    }
}

#endif
