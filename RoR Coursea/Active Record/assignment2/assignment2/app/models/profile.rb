class Profile < ApplicationRecord
  belongs_to :user


  def self.get_all_profiles
    # to avoid SQL Injection
     Profile.where('birth_year BETWEEN :min_age AND :max_age', min_age: 1998, max_age: 2000 )       
  end
end
