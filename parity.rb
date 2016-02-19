require 'formula'

class Parity < Formula
  version '0.9.1'

  homepage 'https://github.com/ethcore/parity'

  if build.include? "master"
    url 'https://github.com/ethcore/parity.git', :branch => 'master', :using => :git
  elsif build.include? "beta"
    url 'https://github.com/ethcore/parity.git', :branch => 'beta', :using => :git
  else
    url 'https://github.com/ethcore/parity.git', :branch => 'beta', :using => :git
  end

  depends_on 'multirust' => :build
  depends_on 'rocksdb'

  option 'master', 'Build and install nightly version.'
  option 'beta', 'Build and install latest beta.'
  option 'stable', 'Install latest stable (default).'

  def install
    if build.include? "master"
      system "multirust update beta"
      system "multirust run beta cargo build --release"
    elsif build.include? "beta"
      system "multirust update nightly-2016-02-14"
      system "multirust run nightly-2016-02-14 cargo build --release"
    else
      system "multirust update nightly-2016-02-14"
      system "multirust run nightly-2016-02-14 cargo build --release"
    end
    bin.install "target/release/parity"
  end

  def plist; <<-EOS.undent
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
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end
