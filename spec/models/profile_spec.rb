require 'rails_helper'
  describe Profile do

      it "ファクトリーボットが登録できること" do        
        user1 = build(:user)
        profile = build(:profile, user: user1)
        profile.valid?
        expect(profile.save).to be_truthy
        # binding.pry
        # expect(profile).to be_valid
        # expect(profile).to exit
        # expect(profile).to Profile.create(profile)?
        # expect(profile.errors[:profile])
      end

      it "first_nameが空だと登録できないこと" do        
        user1 = build(:user)
        profile = build(:profile,user: user1, first_name: "")
        profile.valid?
        expect(profile.save).to be_falsey
      end
      it "first_nameが10文字以下だと登録できる" do    
        str = "a"*10
        user1 = build(:user)
        profile = build(:profile,user: user1, first_name: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "first_nameが11文字以上だと登録できないこと" do        
        str = "a"*11
        user1 = build(:user)
        profile = build(:profile,user: user1, first_name: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "family_nameが空だと登録できないこと" do        
        user1 = build(:user)
        profile = build(:profile, user: user1, family_name: "")
        profile.valid?
        expect(profile.save).to be_falsey
      end
      it "family_nameが10文字以下だと登録できること" do        
        str = "a"*10
        user1 = build(:user)
        profile = build(:profile, user: user1, family_name: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "family_nameが11文字以上だと登録できないこと" do        
        str = "a"*11
        user1 = build(:user)
        profile = build(:profile, user: user1, family_name: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "first_name_kanaが空だと登録できないこと" do        
        user1 = build(:user)
        profile = build(:profile, user: user1, first_name_kana: "")
        profile.valid?
        expect(profile.save).to be_falsey
      end
      it "first_name_kanaが20文字以下だと登録できること" do        
        str = "a"*20
        user1 = build(:user)
        profile = build(:profile, user: user1, first_name_kana: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "first_name_kanaが21文字以上だと登録できないこと" do        
        str = "a"*21
        user1 = build(:user)
        profile = build(:profile, user: user1, first_name_kana: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end


      it "family_name_kanaが空だと登録できないこと" do        
        user1 = build(:user)
        profile = build(:profile, user: user1, family_name_kana: "")
        profile.valid?
        expect(profile.save).to be_falsey
      end
      it "family_name_kanaが20文字以下だと登録できること" do        
        str = "a"*20
        user1 = build(:user)
        profile = build(:profile, user: user1, family_name_kana: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "family_name_kanaが21文字以上だと登録できないこと" do        
        str = "a"*21
        user1 = build(:user)
        profile = build(:profile, user: user1, family_name_kana: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "cityが空だと登録できないこと" do        
        user1 = build(:user)
        profile = build(:profile, user: user1, city: "")
        profile.valid?
        expect(profile.save).to be_falsey
      end
      it "cityが20文字以下だと登録できること" do        
        str = "a"*20
        user1 = build(:user)
        profile = build(:profile, user: user1, city: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "cityが21文字以上だと登録できないこと" do        
        str = "a"*21
        user1 = build(:user)
        profile = build(:profile, user: user1, city: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "post_codeが空だと登録できないこと" do        
        user1 = build(:user)
        profile = build(:profile, user: user1, post_code: "")
        profile.valid?
        expect(profile.save).to be_falsey
      end
      it "post_codeが7文字以下だと登録できること" do        
        str = "a"*7
        user1 = build(:user)
        profile = build(:profile, user: user1, post_code: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "post_codeが8文字以上だと登録できないこと" do        
        str = "a"*8
        user1 = build(:user)
        profile = build(:profile, user: user1, post_code: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "address_numberが空だと登録できないこと" do        
        user1 = build(:user)
        profile = build(:profile, user: user1, address_number: "")
        profile.valid?
        expect(profile.save).to be_falsey
      end
      it "address_numberが40文字以下だと登録できること" do        
        str = "a"*40
        user1 = build(:user)
        profile = build(:profile, user: user1, address_number: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "address_numberが41文字以上だと登録できないこと" do        
        str = "a"*41
        user1 = build(:user)
        profile = build(:profile, user: user1, address_number: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "buildingが40文字以下だと登録できること" do        
        str = "a"*40
        user1 = build(:user)
        profile = build(:profile, user: user1, building: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "buildingが41文字以上だと登録できないこと" do        
        str = "a"*41
        user1 = build(:user)
        profile = build(:profile, user: user1, building: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "primary_schoolが20文字以下だと登録できること" do        
        str = "a"*20
        user1 = build(:user)
        profile = build(:profile, user: user1, primary_school: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "primary_schoolが21文字以上だと登録できないこと" do        
        str = "a"*21
        user1 = build(:user)
        profile = build(:profile, user: user1, primary_school: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "Junior_high_schoolが20文字以下だと登録できること" do        
        str = "a"*20
        user1 = build(:user)
        profile = build(:profile, user: user1, Junior_high_school: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "Junior_high_schoolが21文字以上だと登録できないこと" do        
        str = "a"*21
        user1 = build(:user)
        profile = build(:profile, user: user1, Junior_high_school: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "high_schoolが20文字以下だと登録できること" do        
        str = "a"*20
        user1 = build(:user)
        profile = build(:profile, user: user1, high_school: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "high_schoolが21文字以上だと登録できないこと" do        
        str = "a"*21
        user1 = build(:user)
        profile = build(:profile, user: user1, high_school: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "vocational_schoolが40文字以下だと登録できること" do        
        str = "a"*40
        user1 = build(:user)
        profile = build(:profile, user: user1, vocational_school: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "vocational_schoolが41文字以上だと登録できないこと" do        
        str = "a"*41
        user1 = build(:user)
        profile = build(:profile, user: user1, vocational_school: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "universityが40文字以下だと登録できること" do        
        str = "a"*40
        user1 = build(:user)
        profile = build(:profile, user: user1, university: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "universityが41文字以上だと登録できないこと" do        
        str = "a"*41
        user1 = build(:user)
        profile = build(:profile, user: user1, university: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "graduate_schoolが40文字以下だと登録できること" do        
        str = "a"*40
        user1 = build(:user)
        profile = build(:profile, user: user1, graduate_school: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "graduate_schoolが41文字以上だと登録できないこと" do        
        str = "a"*41
        user1 = build(:user)
        profile = build(:profile, user: user1, graduate_school: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "other_schoolが40文字以下だと登録できること" do        
        str = "a"*40
        user1 = build(:user)
        profile = build(:profile, user: user1, other_school: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "other_schoolが41文字以上だと登録できないこと" do        
        str = "a"*41
        user1 = build(:user)
        profile = build(:profile, user: user1, other_school: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "first_careerが40文字以下だと登録できること" do        
        str = "a"*40
        user1 = build(:user)
        profile = build(:profile, user: user1, first_career: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "first_careerが41文字以上だと登録できないこと" do        
        str = "a"*41
        user1 = build(:user)
        profile = build(:profile, user: user1, first_career: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "second_careerが40文字以下だと登録できること" do        
        str = "a"*40
        user1 = build(:user)
        profile = build(:profile, user: user1, second_career: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "second_careerが41文字以上だと登録できないこと" do        
        str = "a"*41
        user1 = build(:user)
        profile = build(:profile, user: user1, second_career: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "third_careerが40文字以下だと登録できること" do        
        str = "a"*40
        user1 = build(:user)
        profile = build(:profile, user: user1, third_career: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "third_careerが41文字以上だと登録できないこと" do        
        str = "a"*41
        user1 = build(:user)
        profile = build(:profile, user: user1, third_career: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end
      
      it "fourth_careerが40文字以下だと登録できること" do        
        str = "a"*40
        user1 = build(:user)
        profile = build(:profile, user: user1, fourth_career: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "fourth_careerが41文字以上だと登録できないこと" do        
        str = "a"*41
        user1 = build(:user)
        profile = build(:profile, user: user1, fourth_career: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "last_careerが40文字以下だと登録できること" do        
        str = "a"*40
        user1 = build(:user)
        profile = build(:profile, user: user1, last_career: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "last_careerが41文字以上だと登録できないこと" do        
        str = "a"*41
        user1 = build(:user)
        profile = build(:profile, user: user1, last_career: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "introductionが500文字以下だと登録できること" do        
        str = "a"*500
        user1 = build(:user)
        profile = build(:profile, user: user1, introduction: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "introductionが501文字以上だと登録できないこと" do        
        str = "a"*501
        user1 = build(:user)
        profile = build(:profile, user: user1, introduction: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "birth_dateが空だと登録できないこと" do        
        user1 = build(:user)
        profile = build(:profile, user: user1, birth_date: "")
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "phoneが11文字以下だと登録できること" do        
        str = "a"*11
        user1 = build(:user)
        profile = build(:profile, user: user1, phone: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "phoneが12文字以上だと登録できないこと" do        
        str = "a"*12
        user1 = build(:user)
        profile = build(:profile, user: user1, phone: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "hpが60文字以下だと登録できること" do        
        str = "a"*60
        user1 = build(:user)
        profile = build(:profile, user: user1, hp: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "hpが61文字以上だと登録できないこと" do        
        str = "a"*61
        user1 = build(:user)
        profile = build(:profile, user: user1, hp: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "facebookが60文字以下だと登録できること" do        
        str = "a"*60
        user1 = build(:user)
        profile = build(:profile, user: user1, facebook: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "facebookが61文字以上だと登録できないこと" do        
        str = "a"*61
        user1 = build(:user)
        profile = build(:profile, user: user1, facebook: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "twitterが60文字以下だと登録できること" do        
        str = "a"*60
        user1 = build(:user)
        profile = build(:profile, user: user1, twitter: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "twitterが61文字以上だと登録できないこと" do        
        str = "a"*61
        user1 = build(:user)
        profile = build(:profile, user: user1, twitter: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "catch_copyが60文字以下だと登録できること" do        
        str = "a"*60
        user1 = build(:user)
        profile = build(:profile, user: user1, catch_copy: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "catch_copyが61文字以上だと登録できないこと" do        
        str = "a"*61
        user1 = build(:user)
        profile = build(:profile, user: user1, catch_copy: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "avatar_titleが40文字以下だと登録できること" do        
        str = "a"*40
        user1 = build(:user)
        profile = build(:profile, user: user1, avatar_title: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "avatar_titleが41文字以上だと登録できないこと" do        
        str = "a"*41
        user1 = build(:user)
        profile = build(:profile, user: user1, avatar_title: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end

      it "avatar_aboutが500文字以下だと登録できること" do        
        str = "a"*500
        user1 = build(:user)
        profile = build(:profile, user: user1, avatar_about: str)
        profile.valid?
        expect(profile.save).to be_truthy
      end
      it "avatar_aboutが501文字以上だと登録できないこと" do        
        str = "a"*501
        user1 = build(:user)
        profile = build(:profile, user: user1, avatar_about: str)
        profile.valid?
        expect(profile.save).to be_falsey
      end
  end
