class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :entry
      t.string :created
      t.string :updated
      t.string :ip
      t.string :type
      t.string :first
      t.string :last
      t.string :dob
      t.string :email
      t.string :title
      t.string :dept
      t.string :company
      t.string :company_address
      t.string :company_address_two
      t.string :company_city
      t.string :comapny_state
      t.string :company_zip
      t.string :company_country
      t.string :company_email
      t.string :office_phone
      t.string :office_fax
      t.string :office_contact
      t.string :home_address
      t.string :home_address_two
      t.string :home_city
      t.string :home_state
      t.string :home_zip
      t.string :home_country
      t.string :home_phone
      t.string :cell_phone
      t.string :emergency_first
      t.string :emergency_last
      t.string :emergency_phone
      t.string :emergency_relationship
      t.string :airline_1
      t.string :frequent_1
      t.string :airline_2
      t.string :frequent_2
      t.string :airline_3
      t.string :frequent_3
      t.string :airline_4
      t.string :frequent_4
      t.string :seating_preference
      t.string :special_meal
      t.string :hotel_1
      t.string :guest_1
      t.string :hotel_2
      t.string :guest_2
      t.string :hotel_3
      t.string :guest_3
      t.string :hotel_4
      t.string :guest_4
      t.string :rental_1
      t.string :type_1
      t.string :club_1
      t.string :discount_1
      t.string :rental_2
      t.string :type_2
      t.string :club_2
      t.string :discount_2
      t.string :rental_3
      t.string :type_3
      t.string :club_3
      t.string :discount_3
      t.string :additional_info

      t.timestamps
    end
  end
end
