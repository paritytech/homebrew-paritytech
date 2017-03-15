require 'formula'

class Ethabi < Formula
  homepage 'https://github.com/ethcore/ethabi'

  version '1.0.0'
  url 'https://github.com/ethcore/ethabi.git', :branch => 'master', :using => :git

  depends_on 'multirust' => :build

  def install
    system "multirust update stable"
    system "multirust run stable cargo build --release --features='cli'"
    bin.install "target/release/ethabi"
  end
end
