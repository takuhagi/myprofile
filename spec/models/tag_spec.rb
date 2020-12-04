require 'rails_helper'
  describe Tag do
    describe '#create' do
      it "tag_nameがあれば登録できること" do
        tag = build(:tag)
        expect(tag).to be_valid
      end
      it "tag_nameがないと登録できないこと" do
        tag = build(:tag, tag_name:"")
        expect(tag).to be_valid
      end
    end
  end