class SampleFormBuilder < ActionView::Helpers::FormBuilder

  attr_accessor :object_class

  helpers = field_helpers +
            %w{date_select datetime_select time_select} +
            %w{collection_select select country_select time_zone_select} -
            %w{hidden_field label fields_for submit} # Don't decorate these

  helpers.each do |name|
    class_eval %Q!
    def #{name}(field, *args)
      options = args.extract_options\!
      return super if options.delete(:disable_builder)
      @template.content_tag(:p, field_label(field, options) << '<br/>' << super)
    end
    !
  end

  def submit(value = nil, options = {})
    if self.object && value.nil?
      value = self.object.new_record? ? 'Create' : 'Update'
    end
    @template.content_tag( :p, super( value, options ) )
  end

  def field_label( field, options )
    self.label( field, options.delete( :label ) || self.object_class.human_attribute_name( field.to_s ), :class => options[:label_class])
  end

  def initialize(object_name, object, template, options, proc)
    super
    self.object_class = self.object.nil? ? self.object_name.to_s.camelize.constantize : self.object.class
  end

end