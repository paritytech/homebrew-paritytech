require 'formula'

class Ethabi < Formula
  homepage 'https://github.com/paritytech/ethabi'

  version '1.1.0'
  url 'https://github.com/paritytech/ethabi.git', :branch => 'master', :using => :git

  depends_on 'multirust' => :build

  def install
    system "multirust update stable"
    system "multirust run stable cargo build --release -p ethabi-cli"
    bin.install "target/release/ethabi"
  end
end
