# frozen_string_literal: true

require 'rails_helper'

 RSpec.describe User, "モデルに関するテスト", type: :model do
   context "モデルへの保存に関するテスト" do
    let(:user) { build(:user) }
    describe '実際に保存してみる' do
      it "有効な投稿内容の場合は保存されるか" do
        expect(user).to be_valid
      end
    end

    let(:user_without_name) { build(:user, user_name: nil) }
    it "ユーザー名が無ければ無効である" do
      user_without_name.valid?
      expect(user_without_name.errors[:user_name]).to include("を入力してください")
    end

    # let(:user_not_katakana_name) { build(:user, first_name_kana: 'zhongzhi', last_name_kana: 'jianguang') }
    # it "ユーザー名が無ければ無効である" do
    #   user_not_katakana_name.valid?
    #   p user_not_katakana_name.errors
    #   expect(user_not_katakana_name.errors[:last_name_kana]).to include("全角カタカナのみで入力して下さい")
    # end

    let(:user_without_email) { build(:user, email: nil) }
    it "メールアドレスがない場合、無効である"  do
      user_without_email.valid?
      expect(user_without_email.errors[:email]).to include("を入力してください")
    end

    # let(:one_email) { create(:user, email: 'same@same') }
    # let(:same_email) { build(:user, email: 'same@same') }
    # it "重複したメールアドレスの場合、無効である" do
    #   same_email.valid?
    #   p one_email.errors[:email]
    #   p same_email.errors[:email]
    #   expect(same_email.errors[:email]).to include("を入力してください")
    # end

    let(:user_without_password) { build(:user, password: nil) }
    it "パスワードがない場合、無効である" do
      user_without_password.valid?
      expect(user_without_password.errors[:password]).to include("を入力してください")
    end
  end

  context "メソッドのテスト" do
    let(:fullname) { build(:user, first_name: 'zhongzhi', last_name: 'jianguang')}
    it "ユーザーの名前がフルネームでリターン" do
    expect(fullname.name).to eq "zhongzhi jianguang"
    end

    let(:fullname_kana) { build(:user)}
    it "ユーザーの名前がカタカナフルネームでリターン" do
    expect(fullname_kana.kana_name).to eq "カタカナ カタカナ"
    end
  end
 end
