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
    root_url "https://github.com/markusgod/homebrew-tools/releases/download/telepresence-2.8.3"
    sha256 cellar: :any_skip_relocation, monterey:     "4d5a2ff8d19c157b33ac3f71cca2b8d3041df4e80c4be7616cb63b45e3301e06"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "22d47303bfed87f0b7e1bc9cc27873fad103858cd88b218600005ac3efd63218"
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
