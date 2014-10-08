class AddAttachmentPictureObjectsToUsers < ActiveRecord::Migration
  def self.up
	change_table :events do |t|
	  t.attachment :picture_objects
	end
  end

  def self.down
		remove_attachment :events, :picture_objects
  end

  def change
		change_table :events do |t|
			t.attachment :events, :picture_objects
  	end
  end
end


