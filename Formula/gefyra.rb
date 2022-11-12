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
    root_url "https://github.com/markusgod/homebrew-tools/releases/download/gefyra-0.13.2"
    sha256 cellar: :any_skip_relocation, monterey:     "7c21c5dc8d7c223182283263d9d294d2eb751773ad27c23ede8f6a364a860869"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1dfc2e47cb3acdfdd3a595132f1ddeed58d46bf94a9624aa31ddd35c994f03cd"
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
