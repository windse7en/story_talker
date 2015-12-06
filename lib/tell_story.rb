require 'pry'
require 'YAML'

class TellStory
  def initialize
    p 'Please use mac and insure the "say" function works well' if check_tools

  end

  def run
    stories_list = Dir['./stories/*']
    stories_list.shuffle!
    jokes_list = Dir['./jokes/*']
    jokes_list.shuffle!

    tell_story(jokes_list.shift, '笑话')
    #tell_story(stories_list.shift, '故事')
  end

  private

  def tell_story(filename, type)
    story = YAML.load(File.read(filename))
    p "讲个#{type}, #{story["name"]}："
    `say 现在给你讲个#{type}，#{type}的名字叫做#{story["name"]}`
    `say #{story["story"]}`
  end

  def check_tools
    value = `which say`
    false if value.nil? || value.empty?
  end
end

TellStory.new.run()
