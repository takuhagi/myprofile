# # # modelにvalidateの記載がないため保留

# require 'rails_helper'
#   describe User do
#     describe '#create' do

#    it "ファクトリーボットが登録できること" do
#      user = build(:user)
#      user.valid?
#     # user = User.new(nickname: "aaa", email: "aa@aaa",password: "aaaaaa")
#     expect(user.save).to be_truthy
#    end

#    it "自作userが登録できること" do
#     user = User.new(nickname: "aaa", email: "aaa@aaa", password: "aaaaaaaa")
#     user.valid?
#     binding.pry
#    # user = User.new(nickname: "aaa", email: "aa@aaa",password: "aaaaaa")
#    expect(user.save).to be_truthy
#   end


#    it "nicknameがない場合は登録できないこと" do
#      user = build(:user, nickname: "")
#      user.valid?
#      expect(user.save).to be_falsey
#     #  expect(user.errors[:nickname]).to include("を入力してください")
#     #  expect(user.errors).to be_added(:nickname, :blank)
#    end
   
#    it "emailがない場合は登録できないこと" do
#     #  user = build(:user, email: "")
#      user = build(:user)
#      user.valid?
#      expect(user.save).to be_falsey
#     # #  expect(user.errors[:email]).to include("を入力してください")
#     # expect(user.errors).to be_added(:email, :blank)
#     end

#    it "passwordがない場合は登録できないこと" do
#      user = build(:user, password: "")
#      user.valid?
#      expect(user.save).to be_falsey
#     #  expect(user.errors[:password]).to include("を入力してください")
#    end

#    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
#      user = build(:user, password_confirmation: "")
#      user.valid?
#      expect(user.save).to be_falsey
#     #  expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
#    end

#    it "重複したemailが存在する場合登録できないこと" do
#      user = create(:user)
#      another_user = build(:user)
#      another_user.valid?
#      binding.pry
#     #  expect(user.save).to be_falsey
#     #  expect(another_user).to be_valid
#      expect(another_user.errors[:email]).to include("バリデーションに失敗しました")
#    end

#    it "passwordが6文字以上であれば登録できること" do
#      user = build(:user, password: "123456", password_confirmation: "123456")
#      user.valid?
#      expect(user.save).to be_falsey
#    end

#    it "passwordが5文字以下である場合は登録できないこと" do
#      user = build(:user, password: "12345", password_confirmation: "12345")
#      user.valid?
#      expect(user.save).to be_falsey
#     #  expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
#    end
#  end
# end
