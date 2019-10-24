require 'rails_helper'

  describe Buy do 
    describe '#done' do 
      it "is invalid without a status" do 
        status = FactoryBot.build(:buy) 
        status.valid?
    end
  end
end 