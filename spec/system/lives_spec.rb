require 'rails_helper'

describe '投稿のテスト' do
  let!(:live) { create(:live) }
  let!(:band) { create(:band, user: user) }
  let!(:user) { create(:user) }

  before do
    visit new_user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button 'Log in'
  end

  describe 'Liveのnew画面（new_life_path）のテスト' do
    before do
      visit new_life_path
    end

    context '表示の確認' do
      it 'new画面(life_new_path)にband_nameが表示されているか' do
        expect(page).to have_content band.band_name
      end
    end
  end
end
