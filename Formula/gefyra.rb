class Gefyra < Formula
  desc "Blazingly-fast, rock-solid, local application development with Kubernetes"
  homepage "https://gefyra.dev"
  url "https://github.com/gefyrahq/gefyra/archive/refs/tags/0.12.0.tar.gz"
  sha256 "7fb3a9d41db0814d1b8a2ba99303a1170741de9b913d29dfc636a18574418963"
  license "Apache-2.0"
  head "https://github.com/gefyrahq/gefyra.git", branch: "main"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/markusgod/homebrew-tools/releases/download/gefyra-0.12.0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6bc54314030906d6ab5db1d7aebdece33f31cf8305c50063a400bddd1b44be8b"
  end

  depends_on "pyoxidizer" => :build

  def install
    cd "client"
    system "pyoxidizer", "build", "exe", "install", "--release"
  end

  test do
    system "gefyra", "version"
  end
end
