require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '1.9.6'
  url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.9.6/x86_64-apple-darwin/parity'
  sha256 '3fcd0c8740e742b67a7cafe49c305786e3677f19d445b1d596c24746aee352eb'

  devel do
    version '1.10.1'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.10.1/x86_64-apple-darwin/parity'
    sha256 'e68b0cd80e3ca784d9d1c86506f3c158582ebb7e0e43bd1682cd0075892790c6'
  end

  head do
    version '1.11.0'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/nightly/x86_64-apple-darwin/parity'
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
