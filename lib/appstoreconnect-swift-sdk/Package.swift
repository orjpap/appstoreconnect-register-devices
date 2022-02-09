// swift-tools-version:5.5
// We're hiding dev, test, and danger dependencies with // dev to make sure they're not fetched by users of this package.
import PackageDescription

let package = Package(
    name: "AppStoreConnect-Swift-SDK",
    platforms: [
        .iOS(.v11),
        .macOS(.v11),
    ],
    products: [
        // dev .library(name: "DangerDeps", type: .dynamic, targets: ["DangerDependencies"]),
        .library(name: "AppStoreConnect-Swift-SDK", targets: ["AppStoreConnect-Swift-SDK"])
    ],
    dependencies: [
        // dev .package(name: "danger-swift", url: "https://github.com/danger/swift", from: "3.12.1"),
        // dev .package(name: "WeTransferPRLinter", path: "Submodules/WeTransfer-iOS-CI/WeTransferPRLinter")
        .package(url: "https://github.com/apple/swift-crypto.git", "1.0.0" ..< "3.0.0"),
        ],
    targets: [
        // dev .target(name: "DangerDependencies", dependencies: [
        // dev     .product(name: "Danger", package: "danger-swift"),
        // dev     .product(name: "WeTransferPRLinter", package: "WeTransferPRLinter")
        // dev ], path: "Submodules/WeTransfer-iOS-CI/DangerFakeSources", sources: ["DangerFakeSource.swift"]),
        .testTarget(name: "AppStoreConnect-Swift-SDK-Tests", dependencies: ["AppStoreConnect-Swift-SDK"], path: "Tests", exclude: ["LinuxMain.swift"]),
        .target(name: "AppStoreConnect-Swift-SDK",
                dependencies: [
                    .product(name: "Crypto", package: "swift-crypto")
                ],
                path: "Sources")

    ]
)