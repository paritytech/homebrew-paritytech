require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.5.8'
  url 'https://releases.parity.io/ethereum/v2.5.8/x86_64-apple-darwin/parity'
  sha256 '249d8740568a1de091e63e9676c00a2e2a594b5421ec347e5136ad71960b41d0'

  devel do
    version '2.6.3'
    url 'https://releases.parity.io/ethereum/v2.6.3/x86_64-apple-darwin/parity'
    sha256 '7cea9bfbbc7a9b9fb6649c4598288fb5bd3e20475817bd616f7bae3e490b6f34'
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
