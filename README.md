# Literally
*Swift Literal Convertibles for Foundation*

In Swift, literals can be used to provide convenient shorthand initializers for any object conforming to the corresponding protocol. For example, an `NSURL` can be initialized from a string literal (`let url: NSURL = "http://example.com"`) if `NSURL` is extended to conform to the `StringLiteralConvertible` protocol (which implements `convertFromStringLiteral`).

Literally is a demonstration of how Foundation framework classes can be extended to take advantage of this language feature. Best efforts have been made to find useful opportunities, while forgoing ones that could technically work, but would not yield any benefit (e.g. conforming `NSMapTable` to `DictionaryLiteralConvertible`, since it would not be able to specify storage options).

**This is not recommended for usage in production code.** In time, it is expected that Cocoa and the Swift standard library will coalesce in significant ways, making this kind of adaptation irrelevant.

> For more information about literal convertibles in Swift, check out [this NSHipster article](http://nshipster.com/swift-literal-convertible/).

## Installation

_The infrastructure and best practices for distributing Swift libraries is currently being developed by the developer community during this beta period of the language and Xcode. In the meantime, you can simply add Literally as a git submodule, and drag the `Literally.swift` file into your Xcode project._

---

## Inventory

### ArrayLiteralConvertible

- `NSCharacterSet`
- `NSCountedSet` (subclass of `NSMutableSet`)
- `NSIndexPath`
- `NSIndexSet`
- `NSOrderedSet`
- `NSSet`


### NilLiteralConvertible

- `NSNull`

### StringLiteralConvertible

- `NSCharacterSet`
- `NSExpression`
- `NSPredicate`
- `NSRegularExpression`
- `NSScanner`
- `NSTimeZone`
- `NSURL`

## Usage

### NSCharacterSet

```swift
let characterSetFromArray: NSCharacterSet = ["$", "€", "¥", "£"]
characterSetFromArray.bitmapRepresentation

let characterSetFromString: NSCharacterSet = "aeiouy"
characterSetFromString.bitmapRepresentation
```

### NSCountedSet

```swift
let countedSet: NSCountedSet = [1, 2, 2, 3, 3, 3]
countedSet.countForObject(2)
```

### NSExpression

```swift
let expression: NSExpression = "4 + 4"
expression.operand
```

### NSIndexPath

```swift
let indexPath: NSIndexPath = [3,17]
indexPath.indexAtPosition(1)
```

### NSIndexSet

```swift
let indexSet: NSIndexSet = [1, 2, 3, 4, 5]
indexSet.containsIndex(4)
```

### NSNull

```swift
let null: NSNull = nil
```

### NSPredicate

```swift
let predicate = "value <> 'foo'"
```

### NSRegularExpression

```swift
let regex: NSRegularExpression = "foo"
regex.numberOfMatchesInString("foobar", options: nil, range: NSMakeRange(0, 6))
```

### NSScanner

```swift
let scanner: NSScanner = "foo: 1, bar: 2, baz: 3"
var foo: NSString?
scanner.scanUpToString(":", intoString: &foo)
foo!
```

### NSSet

```swift
let set: NSSet = [1, 2, 3]
set.containsObject(3)
```

### NSTimeZone

```swift
let timeZone: NSTimeZone = "America/Los_Angeles"
timeZone.secondsFromGMTForDate(NSDate())
```

### NSURL

```swift
let url: NSURL = "http://github.com/mattt/Literally"
url.host!
```

---

## Contact

Mattt Thompson

- http://github.com/mattt
- http://twitter.com/mattt
- m@mattt.me

## License

Literally is available under the MIT license. See the LICENSE file for more info.
