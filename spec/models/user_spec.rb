require 'rails_helper'

describe User do
  let (:new_user){User.create({username: 'new_user', password: 'password', judge_status: false, email: 'user@email.com'})}
  let(:user) { User.new }
  let(:review) {Review.create({title: 'test title', body: 'test body is here', star_value: 5})}
  let(:comment) {Comment.create({body: "test body"})}

  context "Validations" do

    describe "#username" do
      it "is valid when it's not nil" do
        new_user.valid?
        expect(new_user.errors[:username]).to be_empty
      end
      it "cannot be nil" do
        user.valid?
        expect(user.errors[:username]).to_not be_empty
      end
    end

    describe "#judge_status" do
      it "defaults to false" do
        user.judge_status = ""
        expect(user.judge_status).to eq(nil)
      end
    end

    describe "#email" do
      it "cannot be nil" do
        user.valid?
        expect(user.errors[:email]).to_not be_empty
      end

      it "is valid when it's not nil" do
        new_user.valid?
        expect(user.errors[:email]).to be_empty
      end

      it "is valid if in email format" do
        new_user.valid?
        expect(user.errors[:email]).to be_empty
      end

      it "is not valid if not in proper format" do
        user.email = "asdf223e"
        user.valid?
        expect(user.errors[:email]).to_not be_empty
      end

      it "is not valid when it's not unique" do
        user.email = new_user[:email]
        user.valid?
        expect(user.errors[:email]).to_not be_empty
      end

      it "is valid when it is unique" do
        new_user.valid?
        expect(user.errors[:email]).to be_empty
      end
    end

    describe "#password" do
      it "is valid when it's not nil" do
        new_user.valid?
        expect(user.errors[:password]).to be_empty
      end

      it "cannot be nil" do
        user.valid?
        expect(user.errors[:password]).to_not be_empty
      end
    end

  context "Associations" do
    describe "#user.reviews" do

      it "has an association with reviews" do
        new_user.reviews << review
        expect(new_user.reviews).to_not be_empty
      end

      it "returns an empty array if there are no associations" do
        expect(new_user.reviews).to be_empty
      end

      it "has an association with comments" do
        new_user.comments << comment
        expect(new_user.comments).to_not be_empty
      end

      it "returns an empty array if there are no associations" do
        expect(new_user.comments).to be_empty
        end
      end
    end
  end
end