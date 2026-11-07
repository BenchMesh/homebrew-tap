cask "benchmesh" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.29"
  sha256 arm:   "40613ffa84f8ea166abf33e9273943c1a9b862e5655c53b428be0c7216a308e8",
         intel: "a2ef47ff955f118049d7bf19657a748e6e8de85e76817996c2a7b076d73bf3eb"

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
