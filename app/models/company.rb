class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        Freebie.create(item_name: item_name, value: value, company_id: self.id, dev: dev)
    end

    def self.oldest_company
        years = []

        Company.all.each do |comp|
            years << comp[:founding_year]
        end
        
        years.sort {|a, b| a <=> b}.first
    end
end
