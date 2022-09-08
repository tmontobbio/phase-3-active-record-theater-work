class Role < ActiveRecord::Base
    has_many :auditions

    def auditions
      Audition.where(:role_id == self.id)
    end

    def actors
      self.auditions.pluck(:actor)
    end

    def locations
      self.auditions.pluck(:location)
    end

    def lead
			self.auditions.where(hired: true).first || "no actor has been hired for this role"
    end

    def understudy
			self.auditions.where(hired: true).second || "no actor has been hired for understudy for this role"
    end

end