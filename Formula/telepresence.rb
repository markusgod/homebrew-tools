class Telepresence < Formula
  desc "Fast, efficient local development for Kubernetes microservices"
  homepage "https://www.telepresence.io"
  url "https://github.com/telepresenceio/telepresence.git",
      tag:      "v2.9.1",
      revision: "51113aee6f9be8e8807bf9a06065b3163dd53936"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/markusgod/homebrew-tools/releases/download/telepresence-2.9.1"
    sha256 cellar: :any_skip_relocation, monterey:     "dc27484c9241ef0dfd65e72d265e4c4283b8f875ddcaf0c8cae04f06f032dceb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "576991cba00fcd67ea65950a205d467673e62a40a5e2247cbb09a68448c8a306"
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
