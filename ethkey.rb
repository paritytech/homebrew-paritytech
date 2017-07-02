require 'formula'

class Ethkey < Formula
  homepage 'https://github.com/paritytech/parity'

  version '0.2.0'
  url 'https://github.com/paritytech/parity.git', :branch => 'master', :using => :git

  depends_on 'rustup' => :build

  def install
    system "rustup update stable"
    system "rustup run stable cargo build --release -p ethkey-cli"
    bin.install "target/release/ethkey"
  end
end
