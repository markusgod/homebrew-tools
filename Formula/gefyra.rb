class Gefyra < Formula
  desc "Blazingly-fast, rock-solid, local application development with Kubernetes"
  homepage "https://gefyra.dev"
  url "https://github.com/gefyrahq/gefyra/archive/refs/tags/0.13.2.tar.gz"
  sha256 "7d19df01af64504f578bd274952d68b5aecfdfa21b8a4f569c600f357e02db09"
  license "Apache-2.0"
  head "https://github.com/gefyrahq/gefyra.git", branch: "main"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/markusgod/homebrew-tools/releases/download/gefyra-0.13.1"
    sha256 cellar: :any_skip_relocation, monterey:     "18d4e9bd90ddfc340cdc37681b683402e958b08a28403498f7b6c895c8c7cd6e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "04b890b76c49efd127d1005a35c627ff6020fa3bcd42274b314c9350f3b2a52b"
  end

  depends_on "pyoxidizer" => :build

  def install
    cd "client"
    system "pyoxidizer", "build",  "exe", "--release"
    system "cp `find build/ -name \"gefyra\"` ../gefyra"
    system "strip", "-s", "../gefyra" unless OS.mac?
    bin.install "../gefyra"
  end

  test do
    system "gefyra", "version"
  end
end
