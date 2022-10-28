class Telepresence < Formula
  desc "Fast, efficient local development for Kubernetes microservices"
  homepage "https://www.telepresence.io"
  url "https://github.com/telepresenceio/telepresence.git",
      tag:      "v2.8.3",
      revision: "33defce80abfa8a4cf21c7a6f911b396bf235797"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/markusgod/homebrew-tools/releases/download/telepresence-2.8.2"
    sha256 cellar: :any_skip_relocation, monterey:     "3de1467de95f0ea7a0b5ec43bf1e26e0ededfd19f09dcad78014faa00f2f080c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "883cc3d8d546d716546dd99d8d380a06692b0cd0df0edc01984c1ec97cd0e013"
  end

  depends_on "go" => :build

  def install
    system "make", "build"
    bin.install "build-output/bin/telepresence"
  end

  test do
    system "#{bin}/telepresence", "--help"
  end
end
