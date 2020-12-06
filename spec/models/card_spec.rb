# テスト不可

# require 'rails_helper'
#   describe Card do
#     describe '#create' do
#       it "credit_card_id, customer_id, user_idがあれば登録できること" do
#         card = build(:card)
#         expect(card).to be_valid
#       end
#       it "credit_card_idがないと登録できないこと" do
#         card = build(:card, credit_card_id:"")
#         expect(card).to be_valid
#       end
#       it "customer_idがないと登録できないこと" do
#         card = build(:card, customer_id:"")
#         expect(card).to be_valid
#       end
#       it "user_idがないと登録できないこと" do
#         card = build(:card, user_id:"")
#         expect(card).to be_valid
#       end
#     end
#   end