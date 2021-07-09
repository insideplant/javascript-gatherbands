require 'rails_helper'

describe '投稿のテスト' do
  let!(:user) { create(:user) }
  
  let!(:live) { create(:live) }
  describe 'new画面（life_new_path）のテスト'do
    before do
      vist life_new_path
    end
    context '表示の確認' do
      it 'new画面(life_new_path)にband_nameが表示されているか' do
        ecpect(page).to_have_content band.band_name
      end
    end
  end
end