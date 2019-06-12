require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.4.7'
  url 'https://releases.parity.io/ethereum/v2.4.7/x86_64-apple-darwin/parity'
  sha256 '1e9ef307105cb82efd1870ac2b5622162e72c72e26a45e52769246feb38c488a'

  devel do
    version '2.5.2'
    url 'https://releases.parity.io/ethereum/v2.5.2/x86_64-apple-darwin/parity'
    sha256 'a60aa8bee22af443289225f51f03991a3e659501cc1f0569128a1e041a231454'
  end

  head do
    version '2.6.0'
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
