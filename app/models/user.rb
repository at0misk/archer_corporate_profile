class User < ApplicationRecord
	validates :first, :last, :email, :password, presence: true
	has_secure_password
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :email, :uniqueness => true, :format => { :with => email_regex }
	validates_uniqueness_of :email, :case_sensitive => false
	def self.import(file)
		  spreadsheet = Roo::Spreadsheet.open(file.path)
		  header = spreadsheet.row(1)
		  (2..spreadsheet.last_row).each do |i|
		    row = Hash[[header, spreadsheet.row(i)].transpose]
		    user = find_by(id: row["id"]) || new
		    user.attributes = row.to_hash
		    user.save!
		  end
	end
end
