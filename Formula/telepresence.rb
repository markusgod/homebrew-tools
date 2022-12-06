class Telepresence < Formula
  desc "Fast, efficient local development for Kubernetes microservices"
  homepage "https://www.telepresence.io"
  url "https://github.com/telepresenceio/telepresence.git",
      tag:      "v2.9.4",
      revision: "7c1538227877ae12e2025aaac95ff3dc2c02edb6"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/markusgod/homebrew-tools/releases/download/telepresence-2.9.2"
    sha256 cellar: :any_skip_relocation, monterey:     "5898b5d376ea9f5c61c51946d13f5032f53bdcd0fe02eb351989cfb3ba1e280a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "33cbbd7bf14625ecf975f70525ae4f9f40de225e9206d7ecca74fac2905cd985"
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
