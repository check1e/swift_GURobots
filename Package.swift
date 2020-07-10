// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GURobots",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "GURobots",
            targets: ["GURobots"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "GUSimpleWhiteboard", url: "ssh://git.mipal.net/git/swift_wb", .branch("master")),
        .package(name: "GUCoordinates", url: "ssh://git.mipal.net/git/swift_GUCoordinates.git", .branch("master"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .systemLibrary(name: "CGURobots", pkgConfig: "libgurobots"),
        .target(
            name: "GURobots",
            dependencies: ["CGURobots", "GUCoordinates", "GUSimpleWhiteboard"]),
        .testTarget(
            name: "GURobotsTests",
            dependencies: ["GURobots"]),
    ]
)
