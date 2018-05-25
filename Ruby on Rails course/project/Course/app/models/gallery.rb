class Gallery < ApplicationRecord
	has_many :picture
    
    attr_accessor :picture
    
    has_attached_file :picture, styles: { :medium => "600x600>", :thumb => "200x200>" }
    
    validates_attachment_content_type :picture,
        :content_type => /^image\/(png|gif|jpeg)/,
        :message => 'The file is not png/gif/jpeg'
    
    validates_attachment_size :picture,
        :in => 0..850.kilobytes,
        :message => 'The file is too large. max size is 850 KB'
    
    validates :name,
        :presence => true,
        :length => {:maximum => 120, :message => ": The title is too long." }
    
    
    
    scope :visible, lambda {where(:visible => true)}
    scope :invisible, lambda{where(:visible => false)}
    scope :sort, lambda{order("galleries.position ASC")}
    scope :theNewest, lambda{order("galleries.created_at DESC")}
    
end
