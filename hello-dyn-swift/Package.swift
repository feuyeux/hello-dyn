// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "hello-dyn-swift",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(name: "calculator", targets: ["App"])
    ],
    targets: [
        .target(
            name: "Lib",
            path: "Sources/Lib"
        ),
        .executableTarget(
            name: "App",
            dependencies: ["Lib"],
            path: "Sources/App"
        )
    ]
)
