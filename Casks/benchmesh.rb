cask "benchmesh" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.34"
  sha256 arm:   "c7d4f814511d61819343b6935db37b85588658e537b19e1a4522df3777b40f74",
         intel: "5a0b85afd24965c9358f63555f9b0b2576d47a229b1b920f5d2eb0cbd96fe7ae"

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
