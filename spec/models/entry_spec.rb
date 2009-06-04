# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe Entry do

  context 'on validations' do

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:user_id) }
    
    it { should belong_to(:user) }
    it { should_not allow_mass_assignment_of(:user_id) }

  end

end