class Article < ApplicationRecord
	belongs_to :page
    
    attr_accessor :pictures
    #paperclip validation
  
    has_attached_file :pictures, styles: { :medium => "600x600>", :thumb => "200x200>" }
            
    validates_attachment_content_type :pictures,
            :content_type => /^image\/(png|gif|jpeg)/,
            :message => 'The file is not png/gif/jpeg'
    
    validates_attachment_size :pictures,
            :in => 0..850.kilobytes,
            :message => 'The file is too large. max size is 850 KB'
 
    
    scope :visible, lambda {where(:visible => true)}
    scope :invisible, lambda{where(:visible => false)}
    scope :sort, lambda{order("articles.position ASC")}
    scope :theNewest, lambda{order("articles.created_at DESC")}
end
