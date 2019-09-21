require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    %i(username gender birthday).each do |attr|
      it { should validate_presence_of(attr) }
    end

    it { should validate_length_of(:username).is_at_least(2).is_at_most(25) }

    it { should allow_value('minhha').for(:username) }
    it { should_not allow_value('9minhha').for(:username) }

    it { should allow_value(Date.new(1995, 5, 27)).for(:birthday) }
    it { should_not allow_value(Date.current).for(:birthday) }
    it { should_not allow_value(Date.new(1920, 1, 1)).for(:birthday) }
  end

  describe '#age' do
    let(:user) { build(:user) }

    it 'later than birthday' do
      user.birthday = Date.today.change(year: 1993) - 50.days
      expect(user.age).to eq (Date.today.year - 1993 + 1)
    end

    it 'in birthday' do
      user.birthday = Date.today.change(year: 1993)
      expect(user.age).to eq (Date.today.year - 1993 + 1)
    end

    it 'earlier than birthday' do
      user.birthday = Date.today.change(year: 1993) + 50.days
      expect(user.age).to eq (Date.today.year - 1993)
    end
  end
end
