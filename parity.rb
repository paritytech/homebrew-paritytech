require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.0.8'
  url 'https://releases.parity.io/v2.0.8/x86_64-apple-darwin/parity'
  sha256 '30e4d779257d781f23a619e38a7718748d3f73e77c36677909f3acad81ea0d68'

  devel do
    version '2.1.3'
    url 'https://releases.parity.io/v2.1.3/x86_64-apple-darwin/parity'
    sha256 'a1bac036d4eb2f61b71967d3df6bf240181324865fabe2e8df2c291cfb7b6b8d'
  end

  head do
    version '2.2.0'
    url 'https://releases.parity.io/nightly/x86_64-apple-darwin/parity'
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
