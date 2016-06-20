require 'formula'

class Ethstore < Formula
  homepage 'https://github.com/ethcore/parity'

  version '0.1.0'
  url 'https://github.com/ethcore/parity.git', :branch => 'master', :using => :git

  depends_on 'multirust' => :build

  def install
    system "multirust update stable"
    system "multirust run stable cargo build --release -p ethstore --features='ethcore/ethstore/cli'"
    bin.install "target/release/deps/ethstore"
  end
end
