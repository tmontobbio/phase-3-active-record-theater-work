class Audition < ActiveRecord::Base
  belongs_to :role

  # Belongs_to :role handles this
#   def role
#     Role.find(self.role_id)
#   end

  def call_back
    self.update(hired: hired = true)
  end

end