require 'spec_helper'

describe Task do
  
  let(:task) { build :task, priority: nil }
  it "requires a priority" do
    expect(task).to_not be_valid
  end
  
  let(:task) { build :task, priority: "highest" }
  it "require a priority of only high/medium/low" do
    expect(task).to_not be_valid
  end
  
  
end
