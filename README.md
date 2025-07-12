# Geon's Homebrew Tap

This is my personal homebrew tap containing formulas for my projects.

## Installation

To add this tap to your Homebrew installation:

```bash
brew tap geongeorge/tap
```

## Available Formulas

### threefingers

3 finger tap → middleclick utility for macOS.

**Installation:**
```bash
brew install geongeorge/tap/threefingers
```

**Setup:**
```bash
# Grant accessibility permissions (follow prompts)
threefingers

# Start as service
brew services start geongeorge/tap/threefingers
```

**Usage:**
After installation and setup, simply perform a 3-finger tap on your trackpad to simulate a middle-click.

**Logs:**
```bash
tail -f $(brew --prefix)/var/log/threefingers.log
```

## Updating Formulas

When releasing new versions of your software, you can easily update the formulas in this tap:

### Automatic Update (Recommended)

Use the provided update script:

```bash
./update_formula.sh <version>
```

For example, to update threefingers to version 1.0.3:
```bash
./update_formula.sh 1.0.3
```

This script will:
- Download the new release tarball
- Calculate the SHA256 hash automatically
- Update the formula with the new version, URL, and hash

### Manual Update

If you prefer to update manually:

1. Update the `version` field in the formula
2. Update the `url` to point to the new release
3. Calculate and update the `sha256` hash:
   ```bash
   curl -sL "https://github.com/geongeorge/threefingers/archive/refs/tags/v<VERSION>.tar.gz" | shasum -a 256
   ```

### Testing Updates

After updating a formula, test it locally:
```bash
brew install --build-from-source ./Formula/threefingers.rb
```

## Repository

This tap is hosted at: https://github.com/geongeorge/homebrew-tap

## Support

For issues with specific formulas, please refer to their respective repositories:
- [threefingers](https://github.com/geongeorge/threefingers)
