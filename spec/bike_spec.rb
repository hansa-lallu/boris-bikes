require 'bike'

describe Bike do
  it 'responds to is_working?' do
    expect(subject).to respond_to :is_working?  
  end
  # one line syntax for above: it { is_expected.to respond_to :working?}

  it 'can be reported broken' do
    subject.report_broken
    expect(subject.is_working?).to eq(false)
  end

  it 'returns broken, if bike is broken' do
    subject.report_broken
    expect(subject.broken?).to eq(true)
  end
end
