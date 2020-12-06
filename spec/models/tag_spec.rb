require 'rails_helper'
  describe Tag do
    describe '#create' do
      it "重複したtag_nameは登録できない" do
        tag = build(:tag)
        tag1 = Tag.new(tag_name: "aaa")
        tag.valid?
        tag1.valid?
        tag.save
        expect(tag1.save).to be_falsey
        # expect(tag1.errors).to be_added(:tag_name, :taken)
      end
    end
  end