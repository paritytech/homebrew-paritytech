require 'formula'

class Ethkey < Formula
  homepage 'https://github.com/ethcore/ethkey'

  version '0.2.0'
  url 'https://github.com/ethcore/ethkey.git', :branch => 'master', :using => :git

  depends_on 'multirust' => :build

  def install
    system "multirust update stable"
    system "multirust run stable cargo build --release"
    bin.install "target/release/ethkey"
  end
end
