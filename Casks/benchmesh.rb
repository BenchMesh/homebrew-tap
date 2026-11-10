cask "benchmesh" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.32"
  sha256 arm:   "cc39b0c2294b2165c344eb5d8e37f4c6d8df5ecb123f7da4d49beee4597293af",
         intel: "1253238a865e3f1111b22d263add1bb98787a9cdd4c0a57996672f216fa13f79"

  url "https://github.com/BenchMesh/benchmesh/releases/download/v#{version}/BenchMesh_#{version}_#{arch}.dmg",
      verified: "github.com/BenchMesh/benchmesh/"
  name "BenchMesh"
  desc "One cockpit for lab instruments"
  homepage "https://benchmesh.online/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "BenchMesh.app"

  zap trash: [
    "~/Library/Caches/com.benchmesh.app",
    "~/Library/Saved Application State/com.benchmesh.app.savedState",
    "~/Library/WebKit/com.benchmesh.app",
  ]

  caveats <<~EOS
    BenchMesh is not notarized by Apple yet. If macOS refuses to open it the first time, open
    System Settings - Privacy & Security and press Open Anyway next to BenchMesh.
    Your instruments, recordings and flows are kept in ~/.benchmesh (brew uninstall --zap keeps them).
  EOS
end
