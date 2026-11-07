cask "benchmesh" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.30"
  sha256 arm:   "80b091ebb79387c482e8641a1de2665734ffe3b7afb2ba3a943fc4a5a97c0ee3",
         intel: "424f2d5e1f6b1e6e78378ad370ec3f068e6d64f10f08b2502ba1faebde000540"

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
