require 'formula'

class Ethstore < Formula
  homepage 'https://github.com/paritytech/parity'

  version '0.1.0'
  url 'https://github.com/paritytech/parity.git', :branch => 'master', :using => :git

  depends_on 'multirust' => :build

  def install
    system "multirust update stable"
    system "multirust run stable cargo build --release -p ethstore-cli"
    bin.install "target/release/ethstore"
  end
end
