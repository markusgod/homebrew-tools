class Telepresence < Formula
  desc "Fast, efficient local development for Kubernetes microservices"
  homepage "https://www.telepresence.io"
  url "https://github.com/telepresenceio/telepresence.git",
      tag:      "v2.10.1",
      revision: "70c7ee2533c2a34a1a77c872f2d38084f6c5749f"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/markusgod/homebrew-tools/releases/download/telepresence-2.9.5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f94cf651aceff2a92f92d6cd5c794b2bf7b36c2ab0f81c49129b948b8296c0b0"
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
