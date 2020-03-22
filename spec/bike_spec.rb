require 'bike'

describe Bike do
  it 'responds to broken' do
    expect(subject).to respond_to :broken
  end
  # one line syntax for above: it { is_expected.to respond_to :working?}

  it 'can be reported broken' do
    subject.report_broken
    expect(subject.broken).to eq(true)
  end

  it 'returns broken, if bike is broken' do
    expect(subject.broken).to eq(false)
  end
end
