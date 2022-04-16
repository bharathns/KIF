// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "KIF",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "KIF",
            targets: ["KIF"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "KIF",
            dependencies: [],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("./**"),
                .headerSearchPath("ApplePrivateAPIs/"),
                .headerSearchPath("Additions/"),
                .headerSearchPath("Classes/"),
                .headerSearchPath("Visualizer/"),
                .headerSearchPath("IdentifierTests/"),
            ],
            linkerSettings: [ 
                .linkedFramework("Foundation"),
                .linkedFramework("IOKit"), 
                .linkedFramework("UIKit", .when(platforms: [.iOS])),
                .linkedFramework("QuartzCore", .when(platforms: [.iOS])),
                .linkedFramework("WebKit", .when(platforms: [.iOS])),
                .linkedFramework("CoreGraphics", .when(platforms: [.iOS])),
                .linkedFramework("XCTest", .when(platforms: [.iOS]))
            ]
        ),
        .testTarget(
            name: "KIFTests",
            dependencies: ["KIF"],
            path: "./KIF Tests",
            cSettings: [
                .headerSearchPath("../Sources/KIF/")
            ] // allow to look a "private" headers
        ),
    ]
)
