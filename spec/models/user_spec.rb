require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
    context '新規登録できるとき' do
      it "情報が正しく入力されている時" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      describe "新規登録/ユーザー情報" do
        it "ニックネームが空だと登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "emailが一意性であること" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it "メールアドレスに＠を含んでいないと登録できない" do
          @user.email= "ayataka"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "パスワードが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "パスワードは６文字未満では登録できない" do
          @user.password = "aaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "パスワードは英字のみでは登録できない" do
          @user.password = "aaaaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "パスワードは数字のみでは登録できない" do
          @user.password = "000000"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "パスワードに全角が含むと登録できない" do
          @user.password = "ああああああ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "パスワードは確認用含めて二回入力しないと登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "パスワードと確認用が一致しないと登録できない" do
          @user.password_confirmation = "aa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
      describe "新規登録/本人情報確認" do
        it "姓が空では登録できない" do
          @user.family_name_c = ""
          @user.valid? 
          expect(@user.errors.full_messages).to include("Family name c can't be blank")
        end
        it "名が空では登録できない" do
          @user.first_name_c = ""
          @user.valid? 
          expect(@user.errors.full_messages).to include("First name c can't be blank")
        end
        it "姓（全角）に半角文字が含まれていると登録できない" do
          @user.family_name_c = "takada"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name c is invalid")
        end
        it "名（全角）に半角文字が含まれていると登録できない" do
          @user.first_name_c = "yuma"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name c is invalid")
        end
        it "姓（カナ）が空では登録できない" do
          @user.family_name_k = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name k can't be blank")
        end
        it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
          @user.first_name_k = "あ阿a-^¥]["
          @user.valid?
          expect(@user.errors.full_messages).to include("First name k is invalid")
        end
        it "お名前（カナ）が空では登録できない" do
          @user.first_name_k = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name k can't be blank")
        end
        it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
          @user.first_name_k = "あ阿a-^¥]["
          @user.valid?
          expect(@user.errors.full_messages).to include("First name k is invalid")
        end
        it "生年月日が空では登録できない" do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
