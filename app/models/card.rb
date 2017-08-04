class Card < ApplicationRecord
  belongs_to :user

  def info
    {
      id: self.id,
      uid: self.user.uid,
      user_id: self.user_id,
      name: self.name,
      age: self.age,
      tags: [self.tag_1, self.tag_2, self.tag_3],
      contents: [self.profile_1, self.profile_2, self.profile_3]
    }
  end
end
