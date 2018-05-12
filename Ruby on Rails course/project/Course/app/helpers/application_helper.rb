module ApplicationHelper
    def con_visibility_helper(boolean, options=())
        options[:true_text] ||= ''
        options[:false_text] ||= ''
        if boolean
            content_tag(:span, options[:true_text], :class => 'glyphicon glyphicon-ok-circle' )
        else
            content_tag(:span, options[:true_text], :class => 'glyphicon glyphicon-ban-circle' )
        end
    end
    
    def error(object)
        render(:partial => 'additional_views/warnings', :locals => {:object => object})
    end
    
    
    
end
