# frozen_string_literal: true

class SalonCuraterRunner
  include Capybara::DSL

  def run
    # Yahooで検索してスクリーンショットを取得
    visit 'https://www.yahoo.co.jp'
    page.save_screenshot('ss.png', full: true)
  end
end

SalonCuraterRunner.new.run
