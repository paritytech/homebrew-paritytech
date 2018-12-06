require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.1.9'
  url 'https://releases.parity.io/ethereum/v2.1.9/x86_64-apple-darwin/parity'
  sha256 'aa2f2b6228839526cced76559aeea1e1d6cfb247f9515852698fe42e67702663'

  devel do
    version '2.2.4'
    url 'https://releases.parity.io/ethereum/v2.2.4/x86_64-apple-darwin/parity'
    sha256 '1a6b93a3ff95e15d5eda27aa1e4b92fd96a2e9f1061d8266d67f3dfb32d36b89'
  end

  head do
    version '2.3.0'
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
