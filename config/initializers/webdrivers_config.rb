# frozen_string_literal: true

require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'

ua = 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36'
Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
    args: ['--no-sandbox', '--headless', '--disable-gpu', '--disable-dev-shm-usage', '--window-size=1280x800']
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.configure do |capybara_config|
  capybara_config.default_driver = :selenium_chrome
  capybara_config.default_max_wait_time = 10
end

Capybara.javascript_driver = :selenium_chrome

# Webdrivers::Chromedriver.required_version = '72.0.3626.69'
Webdrivers::Chromedriver.update
# Webdrivers.install_dir = '/usr/bin'
