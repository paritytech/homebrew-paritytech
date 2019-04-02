require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.3.9'
  url 'https://releases.parity.io/ethereum/v2.3.9/x86_64-apple-darwin/parity'
  sha256 '03b6f4cc6d5b063fa18b1576a993ad862d03026a193a0c45ee3e7cc390ee7816'

  devel do
    version '2.4.4'
    url 'https://releases.parity.io/ethereum/v2.4.4/x86_64-apple-darwin/parity'
    sha256 'f195f01ba6d5f30fa3234cf1612630a61634d57cd533e4780d7e30a32fe5695a'
  end

  head do
    version '2.5.0'
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
