require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.2.8'
  url 'https://releases.parity.io/ethereum/v2.2.8/x86_64-apple-darwin/parity'
  sha256 'f24e85d15ffd35dc6118b8bf1986fca96c13f0f1eb190c901b12b19789932351'

  devel do
    version '2.3.1'
    url 'https://releases.parity.io/ethereum/v2.3.1/x86_64-apple-darwin/parity'
    sha256 'b7157d672a92cbb33aa47db26c94a5ae04480f2cec01306df6cc110daa608534'
  end

  head do
    version '2.4.0'
    url 'https://releases.parity.io/ethereum/nightly/x86_64-apple-darwin/parity'
  end

  def install
    bin.install "parity"
  end

  test do
    system "#{bin}/parity", "--version"
  end

  plist_options :manual => "parity"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>ThrottleInterval</key>
        <integer>300</integer>
        <key>ProgramArguments</key>
        <array>
          <string>#{prefix}/bin/parity</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end
