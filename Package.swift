// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "PhoenixKitsuPosts",
  products: [
    .library(name: "PhoenixKitsuPosts", targets: ["PhoenixKitsuPosts"])
  ],
  dependencies: [
    .package(url: "https://github.com/JasonLighthunter/Phoenix-Kitsu-Core.git", .branch("setup"))
  ],
  targets: [
    .target(name: "PhoenixKitsuPosts", dependencies: ["PhoenixKitsuCore"]),
    .testTarget(name: "PhoenixKitsuPostsTests", dependencies: ["PhoenixKitsuPosts"])
  ]
)
