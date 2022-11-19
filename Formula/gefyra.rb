class Gefyra < Formula
  desc "Blazingly-fast, rock-solid, local application development with Kubernetes"
  homepage "https://gefyra.dev"
  url "https://github.com/gefyrahq/gefyra/archive/refs/tags/0.13.3.tar.gz"
  sha256 "b8e6df01f8450979b3ed82c1df86a9f678a044eb4c70089cdd6efb3103f5973a"
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
