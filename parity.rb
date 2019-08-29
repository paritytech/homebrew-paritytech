require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.5.7'
  url 'https://releases.parity.io/ethereum/v2.5.7/x86_64-apple-darwin/parity'
  sha256 '2ca943b20350285c2bac1e8ce4747e42f5ac45b9ed5bacf58cb4b0273b70e501'

  devel do
    version '2.6.2'
    url 'https://releases.parity.io/ethereum/v2.6.2/x86_64-apple-darwin/parity'
    sha256 'a45da1e83248dc5f6394d426abe6eb57757b77d17eece86bc6b3898ca22f0988'
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
