require 'ship'

describe Ship do
  
  it { expect(Ship).to respond_to(:new).with(1).argument }

  it 'ship has default size of 2' do
    expect(subject.size).to eq 2
  end
end
