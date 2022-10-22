class Gefyra < Formula
  desc "Blazingly-fast, rock-solid, local application development with Kubernetes"
  homepage "https://gefyra.dev"
  url "https://github.com/gefyrahq/gefyra/archive/refs/tags/0.11.4.tar.gz"
  sha256 "e89f99b78c08647f1bee267b8712ef3bfe5f999cc98db339fadd0aeb26d6ed98"
  license "Apache-2.0"
  head "https://github.com/gefyrahq/gefyra.git", branch: "main"

  livecheck do
    url :stable
  end

  depends_on "pyoxidizer" => :build

  def install
    cd "client"
    system "pyoxidizer", "build",  "exe", "--release"
    system "cp `find build/ -name \"gefyra\"` ../gefyra"
    system "strip", "-s", "../gefyra"
    bin.install "../gefyra"
  end

  test do
    system "gefyra", "version"
  end
end
