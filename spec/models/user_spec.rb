require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
     it "ニックネームが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",birthday: "1997-06-13",family_name_c: "高田",first_name_c: "悠真",family_name_k: "タカダ",first_name_k: "ユウマ")
      user.valid?
      binding.pry
     end
     it "emailが空では登録できない" do
     end
     it "パスワードが空では登録できない" 
     
     end
     it "お名前が空では登録できない" 
     
     end
     it "お名前カナが空では登録できない" 
     
     end
     it "生年月日が空では登録できない" 
     
     end
   end
 end