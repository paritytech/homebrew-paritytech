require 'formula'

class Ethkey < Formula
  homepage 'https://github.com/paritytech/parity'

  version '0.2.0'
  url 'https://github.com/paritytech/parity.git', :branch => 'master', :using => :git

  depends_on 'multirust' => :build

  def install
    system "multirust update stable"
    system "multirust run stable cargo build --release -p ethkey-cli"
    bin.install "target/release/ethkey"
  end
end
