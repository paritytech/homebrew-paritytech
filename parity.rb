require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.2.11'
  url 'https://releases.parity.io/ethereum/v2.2.11/x86_64-apple-darwin/parity'
  sha256 '853b8546722391b40912984b3f42828efafc71ef977f39042a91c61ec0c0c943'

  devel do
    version '2.3.4'
    url 'https://releases.parity.io/ethereum/v2.3.4/x86_64-apple-darwin/parity'
    sha256 'f32a47d8395ff7caa0d1c84032ab6588696069d34d401d89329a90650559f957'
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
