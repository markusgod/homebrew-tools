class Gefyra < Formula
  desc "Blazingly-fast, rock-solid, local application development with Kubernetes"
  homepage "https://gefyra.dev"
  url "https://github.com/gefyrahq/gefyra/archive/refs/tags/0.13.0.tar.gz"
  sha256 "b93cb6931ff1fd208069d4dc4d866f95dfce71f84bda856781af4c5d7cb16765"
  license "Apache-2.0"
  head "https://github.com/gefyrahq/gefyra.git", branch: "main"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/markusgod/homebrew-tools/releases/download/gefyra-0.13.0"
    sha256 cellar: :any_skip_relocation, monterey:     "4bba39ee233976d50d8eacff10932da50dbb400fccb1a5660b8f4e9ddda5f26b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3687130e0373b1958deea0b60e59761e5bc521ce1c77c848f1d046418187ba70"
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
