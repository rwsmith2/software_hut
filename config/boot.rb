ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

# WSL2 only (for email preview)
ENV['BROWSER'] = './launch_browser_wsl %s'

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
