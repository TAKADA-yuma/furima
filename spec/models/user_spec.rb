require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "新規登録/ユーザー情報" do
     it "ニックネームが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
     end
     it "emailが一意性であること" do
      user = FactoryBot.build(:user)
      user2 = FactoryBot.build(:user2)
      user2.valid?
      expect(user2.errors.full_messages).to include("Email can't be blank")
     end
     it "メールアドレスに＠を含んでいないと登録できない" do
      user = FactoryBot.build(:user)
      user.email= "ayataka"
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
     end
     it "パスワードが空では登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
     end
     it "パスワードは６文字未満では登録できない" do
      user = FactoryBot.build(:user)
      user.password = "aaaaa"
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it "パスワードは英数字混合でなければ登録できない" do
      user = FactoryBot.build(:user)
      user.password = "aaaaaaaa"
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
     end
     it "パスワードは確認用含めて二回入力しないと登録できない" do
      user = FactoryBot.build(:user)
      user.password_confirmation = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "パスワードと確認用が一致しないと登録できない" do
      user = FactoryBot.build(:user)
      user.password_confirmation = "aa"
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
   end

   describe "新規登録/本人情報確認" do
    it "お名前（苗字）が空では登録できない" do
      user = FactoryBot.build(:user)
      user.family_name_c = ""
      user.valid?
      expect(user.errors.full_messages).to include("Family name c can't be blank")
     end
     it "お名前（名前）が空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name_c = ""
      user.valid?
      expect(user.errors.full_messages).to include("First name c can't be blank")
     end
     it "苗字（カナ）が空では登録できない" do
      user = FactoryBot.build(:user)
      user.family_name_k = ""
      user.valid?
      expect(user.errors.full_messages).to include("Family name k can't be blank")
     end
     it "お名前（カナ）が空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name_k = ""
      user.valid?
      expect(user.errors.full_messages).to include("First name k can't be blank")
     end
     it "生年月日が空では登録できない" do
      user = FactoryBot.build(:user)
      user.birthday = ""
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
     end
   end
 end