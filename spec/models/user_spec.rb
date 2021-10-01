require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
     it "ニックネームが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",birthday: "1997-06-13",family_name_c: "高田",first_name_c: "悠真",family_name_k: "タカダ",first_name_k: "ユウマ")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
      user = User.new(nickname: "TAKADA", email: "", password: "00000000", password_confirmation: "00000000",birthday: "1997-06-13",family_name_c: "高田",first_name_c: "悠真",family_name_k: "タカダ",first_name_k: "ユウマ")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
     end
     it "パスワードが空では登録できない" do
      user = User.new(nickname: "TAKADA", email: "kkk@gmail.com", password: "", password_confirmation: "",birthday: "1997-06-13",family_name_c: "高田",first_name_c: "悠真",family_name_k: "タカダ",first_name_k: "ユウマ")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
     end
     it "お名前（苗字）が空では登録できない" do
      user = User.new(nickname: "TAKADA", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",birthday: "1997-06-13",family_name_c: "",first_name_c: "悠真",family_name_k: "タカダ",first_name_k: "ユウマ")
      user.valid?
      expect(user.errors.full_messages).to include("Family name c can't be blank")
     end
     it "お名前（名前）が空では登録できない" do
      user = User.new(nickname: "TAKADA", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",birthday: "1997-06-13",family_name_c: "高田",first_name_c: "",family_name_k: "タカダ",first_name_k: "ユウマ")
      user.valid?
      expect(user.errors.full_messages).to include("First name c can't be blank")
     end
     it "苗字（カナ）が空では登録できない" do
      user = User.new(nickname: "TAKADA", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",birthday: "1997-06-13",family_name_c: "高田",first_name_c: "悠真",family_name_k: "",first_name_k: "ユウマ")
      user.valid?
      expect(user.errors.full_messages).to include("Family name k can't be blank")
     end
     it "お名前（カナ）が空では登録できない" do
      user = User.new(nickname: "TAKADA", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",birthday: "1997-06-13",family_name_c: "高田",first_name_c: "悠真",family_name_k: "タカダ",first_name_k: "")
      user.valid?
      expect(user.errors.full_messages).to include("First name k can't be blank")
     end
     it "生年月日が空では登録できない" do
      user = User.new(nickname: "TAKADA", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",birthday: "",family_name_c: "高田",first_name_c: "悠真",family_name_k: "タカダ",first_name_k: "ユウマ")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
     end
   end
 end