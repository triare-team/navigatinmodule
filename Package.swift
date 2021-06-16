// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NavigationModule",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "NavigationModule",targets: ["NavigationModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/HeroTransitions/Hero.git", .upToNextMajor(from: "1.4.0")),
    ],
    targets: [
        .target(name: "NavigationModule",
                dependencies: ["Hero"],
                path: "NavigationModule",
                exclude: ["NavigationModule/Info.plist", "NavigationModuleTests"]),
        .testTarget(name: "NavigationModuleTests",
                    dependencies: ["NavigationModule"]),
    ]
)
