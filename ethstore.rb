require 'formula'

class Ethstore < Formula
  homepage 'https://github.com/paritytech/parity'

  version '0.1.0'
  url 'https://github.com/paritytech/parity.git', :branch => 'master', :using => :git

  depends_on 'rustup' => :build

  def install
    system "rustup update stable"
    system "rustup run stable cargo build --release -p ethstore-cli"
    bin.install "target/release/ethstore"
  end
end
