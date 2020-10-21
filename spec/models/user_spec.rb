require 'rails_helper'

# RSpec.describe User, type: :model do
RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、password,password_confirmation,family_name_kanji,first_name_kanji,family_name_kana,family_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid  
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "abc000"
        @user.password_confirmation = "abc000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailに@を含んでいない場合は登録出来ない" do
        @user.email = "abcde"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "123aaa"
        @user.password_confirmation = "123abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_name_kanjiが空では登録できない" do
        @user.family_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
      end
      it "first_name_kanjiが空では登録できない" do
        @user.first_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it "family_name_kanaが空では登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      # 半角英数混合
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Passwordis invalid. Input half-width characters.")
      end

      # 全角入力
      it 'family_name_kanjiが全角入力でなければ登録できないこと' do
        @user.family_name_kanji = "ｱｲｳｴｵ" # 意図的に半角入力を行いエラーを発生させる
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji 全角文字を使用してください")
      end
      it 'first_name_kanjiが全角入力でなければ登録できないこと' do
        @user.first_name_kanji = "ｱｲｳｴｵ" # 意図的に半角入力を行いエラーを発生させる
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji 全角文字を使用してください")
      end

      it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.family_name_kana = "あいうえお" # 意図的にひらがな入力を行いエラーを発生させる
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana Last name kana Full-width katakana characters")
      end
      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.first_name_kana = "あいうえお" # 意図的にひらがな入力を行いエラーを発生させる
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Family name kana Full-width katakana characters")
      end
      
      it "birthdayが空では登録できないこと" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end