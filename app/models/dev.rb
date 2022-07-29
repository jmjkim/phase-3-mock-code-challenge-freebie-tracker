class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.exists?(item_name: item_name)
    end

    def give_away(dev, freebie)
        recipient_id = Dev.all.find_by(name: dev)[:id]
        given_freebie = Freebie.all.find_by(item_name: freebie)

        if self.id == given_freebie[:dev_id]
            given_freebie.update(dev_id: recipient_id)
            puts "#{freebie} is given to #{dev}."
        end
    end
end
