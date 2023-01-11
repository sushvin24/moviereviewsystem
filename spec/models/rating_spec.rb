require 'rails_helper'

RSpec.describe Rating, type: :model do
  subject {
    described_class.new(rate: 5,
                        movie_id: Movie.first.id,
                        user_id: User.first.id
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a rate" do
    subject.rate = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a Movie ID" do
    subject.movie_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a User ID" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
