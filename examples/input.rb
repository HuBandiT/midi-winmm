dir = File.dirname(File.expand_path(__FILE__))
$LOAD_PATH.unshift dir + '/../lib'

require 'midi-winmm'

# this program selects the first midi input and sends an inspection of the first 10 messages 
# messages it receives to standard out

num_messages = 10

# MIDIWinMM::Device.all.to_s will list your midi outputs

MIDIWinMM::Device.first(:input).enable do |input|

  $>.puts "send some MIDI to your input now..."

  num_messages.times do
    m = input.read
    $>.puts(m)
  end

  $>.puts "finished"

end