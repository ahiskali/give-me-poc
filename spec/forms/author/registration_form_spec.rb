require 'rails_helper'

describe Author::RegistrationForm do
  subject { described_class.new(model) }
  let(:model) { User.new }
  let(:errors) { subject.errors.messages.keys }

  before { subject.validate(params) }


  context 'invalid params' do
    let(:params) { {} }

    # TODO: write custom matcher for this
    it { expect(errors).to include :email }
    it { expect(errors).to include :password }
    it { expect(errors).to include :first_name }
    it { expect(errors).to include :last_name }
    it { expect(errors).to include :location }
    it { expect(errors).to include :timezone }

    it { is_expected.not_to be_valid }
  end

  context 'valid params' do
    let(:params) do
      {
        email: 'user@givemepoc.org',
        password: 'password',
        first_name: 'John',
        last_name: 'Smith',
        location: 'Russia',
        timezone: 'Europe/Moscow'
      }
    end

    it { expect(errors).not_to include :email }
    it { expect(errors).not_to include :password }
    it { expect(errors).not_to include :first_name }
    it { expect(errors).not_to include :last_name }
    it { expect(errors).not_to include :location }
    it { expect(errors).not_to include :timezone }

    it { is_expected.to be_valid }
  end
end
