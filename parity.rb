require 'formula'

class Parity < Formula
  homepage 'https://github.com/paritytech/parity'
  version '1.11.8'
  url 'https://releases.parity.io/v1.11.8/x86_64-apple-darwin/parity'
  sha256 '1c67804429a5c306a4ed02250e78fb57cc14747fb01cdf679c3e4edbf5683be3'

  devel do
    version '2.0.1'
    url 'https://releases.parity.io/v2.0.1/x86_64-apple-darwin/parity'
    sha256 'fa789a4fa43200eb648f34b645ef5cbd8559db8eba3909efff851b33238b15c6'
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
