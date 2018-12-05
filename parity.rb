require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.1.8'
  url 'https://releases.parity.io/ethereum/v2.1.8/x86_64-apple-darwin/parity'
  sha256 'd496bb6785f81482984084f96f5c7a1aa6753c56ea365f8e24279da6f52a13cd'

  devel do
    version '2.2.3'
    url 'https://releases.parity.io/ethereum/v2.2.3/x86_64-apple-darwin/parity'
    sha256 'c1557e3c8f4257348053ef1560621303790cf636b5f3c86c09ce92a5a535ae95'
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
