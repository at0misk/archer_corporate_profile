class User < ApplicationRecord
	validates :first, :last, :password, presence: true
	has_secure_password
	# email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	# validates :email, :uniqueness => true, :format => { :with => email_regex }
   before_save :downcase_fields

   def downcase_fields
      self.email.downcase!
   end
	def self.import(file)
		  spreadsheet = Roo::Spreadsheet.open(file.path)
		  header = spreadsheet.row(1)
		  (2..spreadsheet.last_row).each do |i|
		    row = Hash[[header, spreadsheet.row(i)].transpose]
		    user = find_by(id: row["id"]) || new
		    user.attributes = row.to_hash
			random_password = Array.new(6).map { rand(10).to_s }.join
			user.password = random_password
			user.password_confirmation = random_password
		    user.save!
		  end
	end
end
