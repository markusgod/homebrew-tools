class Telepresence < Formula
  desc "Fast, efficient local development for Kubernetes microservices"
  homepage "https://www.telepresence.io"
  url "https://github.com/telepresenceio/telepresence.git",
      tag:      "v2.9.5",
      revision: "216c5cdd5bc925dcaa044e90448f4a1ea03fbd89"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/markusgod/homebrew-tools/releases/download/telepresence-2.9.4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3df8d5bc1c5cac1a7149c0f883b0d86b3278a3636328e3aecbc49da671fd8524"
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
