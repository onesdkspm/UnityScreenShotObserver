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
        .package(url: "https://github.com/onesdkspm/BTScreenShot.git", from: "2.0.2"),
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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityScreenShotObserver/2.0.2/UnityScreenShotObserver.xcframework.zip",
            checksum: "488b59ab1bb506a46b1484498b30050cd594b20d27fbf886756cca442a06df35"
        )
    ]
)
