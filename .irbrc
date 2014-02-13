require 'irb/completion'
require 'wirble'

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

Wirble.init
Wirble.colorize

Wirble::Colorize.colors = {
  :open_hash   => :white,
  :close_hash  => :white,
  :open_array  => :white,
  :close_array => :white,

  :open_object        => :light_red,
  :close_object       => :light_red,
  :object_class       => :white,
  :object_addr_prefix => :blue,
  :object_line_prefix => :blue,

  :symbol        => :red,
  :symbol_prefix => :red,

  :comma  => :white,
  :refers => :white,

  :open_string  => :yellow,
  :close_string => :yellow,
  :string       => :yellow,

  :number  => :light_red,
  :keyword => :blue,
  :class   => :purple,
  :range   => :red
}

def cls
  system('cls')
end