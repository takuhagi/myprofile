require 'rails_helper'
  describe Profile do
    describe '#create' do
      it "ファクトリーボットが登録できること" do        
        profile = build(:profile)
        expect(profile).to be_valid
      end

      it "ファクトリーボットが登録できること" do        
        profile = build(:profile)
        expect(profile).to be_valid
      end
    end
  end
