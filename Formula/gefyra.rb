class Gefyra < Formula
  desc "Blazingly-fast, rock-solid, local application development with Kubernetes"
  homepage "https://gefyra.dev"
  url "https://github.com/gefyrahq/gefyra/archive/refs/tags/0.13.4.tar.gz"
  sha256 "137cc444280894b865b1297191604488bebd60b845d0a0302a7e8b7e8868e93a"
  license "Apache-2.0"
  head "https://github.com/gefyrahq/gefyra.git", branch: "main"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/markusgod/homebrew-tools/releases/download/gefyra-0.13.3"
    sha256 cellar: :any_skip_relocation, monterey:     "266bd7299ca155e354aef7d764e271ca40cdbae43f61d092ceada060be64a86c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f671e835be43dc7dce32a90a91e74f01432fae7e955b68d5cd7b8547313853dd"
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
