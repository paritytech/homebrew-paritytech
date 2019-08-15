require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.5.6'
  url 'https://releases.parity.io/ethereum/v2.5.6/x86_64-apple-darwin/parity'
  sha256 '81352b111872304466868c9193a881fccc76864dbf571b18e7bebf4d8cdbaadc'

  devel do
    version '2.6.1'
    url 'https://releases.parity.io/ethereum/v2.6.1/x86_64-apple-darwin/parity'
    sha256 '476817293dedabc05f3eb7f8d0e172d9fb0fe82087c120ac1f2e547e7abf2b8e'
  end

  head do
    version '2.7.0'
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
