require 'rails_helper'

describe Question do
  it { should validate_presence_of :question }
  it { should validate_presence_of :user_id }
end
