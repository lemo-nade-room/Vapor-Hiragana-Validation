# Vapor-Hiragana-Validation

## ライセンス
このライブラリはMITライセンスに準拠しています。LICENSEをご覧ください。

## 概要
Server-Side Swift Vaporにおいて、平仮名のValidationを拡張するライブラリです。

## 使い方
Package.Swiftに以下の記述を追加します。

```swift
let package = Package(
    platforms: [
       .macOS(.v12)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        ...,
        .package(url: "git@github.com:lemo-nade-room/Vapor-Hiragana-Validation.git", from: "1.0.0"), // 追加
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                ...,
                "Vapor-Hiragana-Validation", // 追加
            ],
        )
    ]
)
```

Validationとしてひらがなを追加します。
```swift
import Vapor
import Vapor_Hiragana_Validation

struct Text: Content {
    var text: String
}

extension Text: Validatable {
    static func validations(_ validations: inout Validations) {
        validations.add("text", as: String.self, is: .hiragana)
    }
}
```
