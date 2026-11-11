cask "benchmesh" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.33"
  sha256 arm:   "6c26d6116ea6539e900fd88f7b20421cf9fa0557356fcdbe4c7ab4f6d6738a1e",
         intel: "2b800979428f18c61a9507e3fe9d1d83a9d87e71ab6b136578ac47e2083172fc"

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
