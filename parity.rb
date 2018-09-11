require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '1.11.11'
  url 'https://releases.parity.io/v1.11.11/x86_64-apple-darwin/parity'
  sha256 'c673865c440adb4ca612e3772954cf09bd9825ca89d8ad9a6829db6f0394ded8'

  devel do
    version '2.0.4'
    url 'https://releases.parity.io/v2.0.4/x86_64-apple-darwin/parity'
    sha256 '768b397076db7e51fd62cefc632723272162bae872a65bba7a6f5cbc523fa6c3'
  end

  head do
    version '2.1.0'
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
