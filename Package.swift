// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "UnityScreenShotObserver",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "UnityScreenShotObserver",
            targets: ["UnityScreenShotObserverWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.0"),
        .package(url: "https://github.com/onesdkspm/BTScreenShot.git", branch: "develop"),
    ],
    targets: [
        // ========== Wrapper Target（统一管理系统依赖）==========
        .target(
            name: "UnityScreenShotObserverWrapper",
            dependencies: [
                .byName(name: "UnityScreenShotObserver"),
                .product(name: "UnityBridge", package: "UnityBridge"),
                .product(name: "BTScreenShot", package: "BTScreenShot"),
            ],
            path: "UnityScreenShotObserverWrapper",
            linkerSettings: [
                // iOS 系统框架
                
                // 系统库
            ]
        ),
        
        // ========== Binary Frameworks ==========
        .binaryTarget(
            name: "UnityScreenShotObserver",
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityScreenShotObserver/1.3.0-dev-1474876/UnityScreenShotObserver.xcframework.zip",
            checksum: "f7c5a09bd17756118559f89118cb1f0fca650b62ba17ad425be8594b4fa75661"
        )
    ]
)
