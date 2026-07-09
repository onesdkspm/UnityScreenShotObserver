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
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.3"),
        .package(url: "https://github.com/onesdkspm/BTScreenShot.git", from: "2.0.3"),
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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityScreenShotObserver/2.0.3/UnityScreenShotObserver.xcframework.zip",
            checksum: "4ca9fe94e38714ffac94060078e9fe4256f19ffb247971d37db528fc36b0b791"
        )
    ]
)
