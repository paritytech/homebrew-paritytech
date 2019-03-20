require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '2.3.7'
  url 'https://releases.parity.io/ethereum/v2.3.7/x86_64-apple-darwin/parity'
  sha256 '6078f0a3750a4c1f8291dee1b2dea05d97f09a5075c71e1cff80cd39bc54433d'

  devel do
    version '2.4.2'
    url 'https://releases.parity.io/ethereum/v2.4.2/x86_64-apple-darwin/parity'
    sha256 'd56bfbe7d032e8d0e313cb1591965f7482c359775370c654e36d6b7d31e1046a'
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
