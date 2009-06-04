
[ 'tag', 'tagging', 'tag_list' ].each do |f|
  require File.dirname(__FILE__) + "/lib/#{f}.rb"
end

require File.dirname(__FILE__) + '/lib/acts_as_taggable'
