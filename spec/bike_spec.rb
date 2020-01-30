require 'bike'

describe Bike do
  it 'responds to working?' do
    expect(subject).to respond_to :working?
  end
  # one line syntax for above: it { is_expected.to respond_to :working?}

  it 'can be reported broken' do
    subject.report_broken
    expect(subject).to be_broken
  end
end
