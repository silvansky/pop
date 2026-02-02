// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "pop",
    platforms: [.iOS(.v12), .macOS(.v10_13), .tvOS(.v12)],
    products: [
        .library(name: "pop", targets: ["pop"])
    ],
    targets: [
        .target(
            name: "pop",
            path: "pop",
            exclude: [
                "module.modulemap",
                "pop-ios-Info.plist",
                "pop-osx-Info.plist",
                "pop-tvos-Info.plist"
            ],
            publicHeadersPath: "include",
            cxxSettings: [
                .define("__ASSERT_MACROS_DEFINE_VERSIONS_WITHOUT_UNDERSCORES", to: "0"),
                .headerSearchPath("."),
                .headerSearchPath("WebCore"),
                .headerSearchPath("include")
            ],
            linkerSettings: [
                .linkedLibrary("c++")
            ]
        )
    ],
    cxxLanguageStandard: .cxx11
)
