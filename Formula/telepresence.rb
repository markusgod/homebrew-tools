class Telepresence < Formula
  desc "Fast, efficient local development for Kubernetes microservices"
  homepage "https://www.telepresence.io"
  url "https://github.com/telepresenceio/telepresence.git",
      tag:      "v2.8.5",
      revision: "5e35aa6f5d4c16aee3eba3c887cb146b3ba524cc"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/markusgod/homebrew-tools/releases/download/telepresence-2.8.5"
    sha256 cellar: :any_skip_relocation, monterey:     "751b2310ba8392a204dc18097064db90490feff0635b174f2888f7ea751be605"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e605f43ee115d2589cf298627fbe5c18bff2a943e18ea7e13408083623f578d3"
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
