require_relative "./spec_helper.rb"

describe '#decode' do 

  it 'finds the pair of identical characters that are farthest apart that contain no pairs of identical characters between them, removes one of the characters in the pair, and moves the other to the end of the string' do
    expect(decode("arpat")).to eq("rpta")
    expect(decode("rawinbwo")).to eq("rainbow")
    expect(decode("dermastoglyphsic")).to eq("dermatoglyphics")
  end

  it 'continues the process described in the spec above until no qualifying characters are left' do
    expect(decode("roawinbow")).to eq("rainbow")
    expect(decode("dermcatoglcypshsi")).to eq("dermatoglyphics")
    expect(decode("cronquet-plagying")).to eq("croquet-playing")
    expect(decode("amyblyidextlrous")).to eq("ambidextrously")
  end

  it 'removes undescores and any characters following the underscore' do
    expect(decode("abc_def")).to eq("abc")
  end 

  it 'correctly calculates the final result of a short string' do
    expect(decode('daccadfghd_i')).to eq("fgh")
  end

end