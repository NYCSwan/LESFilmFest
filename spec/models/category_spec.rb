require 'rails_helper'
describe Category do
  let(:category1){Category.new}
  let(:category2){Category.create({name: "comedy"})}
  let(:film) {Film.create({title: "Inception",description: "Pretty dreamy movie", director: "Nolan", writers: "Jon Nolan", actors: "Peo Picaprio"})}
  let(:review){Rating.create({title: "It was fine", body: "I would see this again, probably", star_value: 2})}

  context "Validations" do
    describe "#name" do
      it "is valid with a name" do
        category2.valid?
        expect(category2.errors[:name]).to be_empty
      end

      it "is invalid without a name" do
        category1.valid?
        expect(category1.errors[:name]).to_not be_empty
      end
    end

  end

  context "Associations" do

    describe "#category.films" do
      it "returns a list of films that are associated with it" do
        category2.films << film
        expect(category2.films).to_not be_empty
      end

      it "returns an empty array if it has no films" do
        expect(category2.films).to be_empty
      end
    end

  end
end