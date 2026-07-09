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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityScreenShotObserver/2.0.3-dev-1482643/UnityScreenShotObserver.xcframework.zip",
            checksum: "1e42eb00f939bf51bf0885e556f11d9f7982b9b98229c109e168d2ce615b7800"
        )
    ]
)
