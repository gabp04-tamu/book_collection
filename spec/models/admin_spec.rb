require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe '.from_google' do
    let(:google_params) do
      {
        email: 'testadmin@example.com',
        full_name: 'Test Admin',
        uid: '123456789',
        avatar_url: 'https://example.com/avatar.jpg'
      }
    end

    context 'sunny day: valid Google account data' do
      it 'creates a new admin record when one does not exist' do
        expect {
          Admin.from_google(**google_params)
        }.to change(Admin, :count).by(1)
      end

      it 'returns the admin with the correct attributes' do
        admin = Admin.from_google(**google_params)
        expect(admin.email).to eq('testadmin@example.com')
        expect(admin.full_name).to eq('Test Admin')
        expect(admin.uid).to eq('123456789')
      end

      it 'finds the existing admin instead of duplicating it on a second login' do
        first_login = Admin.from_google(**google_params)
        expect {
          Admin.from_google(**google_params)
        }.not_to change(Admin, :count)
        second_login = Admin.from_google(**google_params)
        expect(second_login.id).to eq(first_login.id)
      end
    end

    context 'rainy day: missing required email' do
      it 'raises a database-level error and does not create an admin' do
        expect {
          Admin.from_google(**google_params.merge(email: nil))
        }.to raise_error(ActiveRecord::NotNullViolation)
        expect(Admin.count).to eq(0)
      end
    end
  end
end
