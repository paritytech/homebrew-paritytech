require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '1.9.7'
  url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.9.7/x86_64-apple-darwin/parity'
  sha256 '9243b3af17540c9a8b82be613131eca3f294baf600acacca4812b0d54d5f24ea'

  devel do
    version '1.10.2'
    url 'https://d1h4xl4cr1h0mo.cloudfront.net/v1.10.2/x86_64-apple-darwin/parity'
    sha256 '6ea5194bb20de5046771b437e00cfb4656265208d46b7c0fa9107d15b3a6d69a'
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
