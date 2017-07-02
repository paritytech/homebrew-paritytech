require 'formula'

class Ethabi < Formula
  homepage 'https://github.com/paritytech/ethabi'

  version '1.1.0'
  url 'https://github.com/paritytech/ethabi.git', :branch => 'master', :using => :git

  depends_on 'rustup' => :build

  def install
    system "rustup update stable"
    system "rustup run stable cargo build --release -p ethabi-cli"
    bin.install "target/release/ethabi"
  end
end
