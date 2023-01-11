require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject {
    described_class.new(title: "Movie Title",
                        director: "Movie Director",
                        description: "Movie Description",
                        release_date: "2023-01-09"
    )
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a director" do
    subject.director = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a release_date" do
    subject.release_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end
