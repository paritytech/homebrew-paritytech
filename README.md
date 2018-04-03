# Homebrew Tap for Parity

Homebrew is the missing package manager for macOS. You can find installation instructions at [brew.sh](https://brew.sh/).

### Adding Parity to your list of Homebrew taps

Open your terminal and enter:

```bash
brew tap paritytech/paritytech
```

### Installing Parity

We recommend using the latest feature-rich **beta** release, to install it use:

```
brew install parity --devel
```

If you need to use the **stable** version install it with:

```
brew install parity
```

The latest **nightly** development releases are available via:

```
brew install parity --HEAD
```

In order to update parity to the latest version of the track you're using:

```
brew upgrade parity
```

### Installing additional tools

Additional binaries are available via:

```bash
brew install ethabi
brew install ethkey
brew install ethstore
```
