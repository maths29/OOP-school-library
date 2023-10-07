require_relative 'spec_helper'

describe ClassRoom do
  describe '#initialize' do
    it 'creates a ClassRoom instance with the given label' do
      classroom = ClassRoom.new('Math101')
      expect(classroom).to be_an_instance_of(ClassRoom)
      expect(classroom.label).to eq('Math101')
    end

    it 'initializes an empty students array' do
      classroom = ClassRoom.new('Science202')
      expect(classroom.students).to be_an_instance_of(Array)
      expect(classroom.students).to be_empty
    end
  end

  describe 'attribute accessors' do
    it 'allows reading and writing the label' do
      classroom = ClassRoom.new('History303')
      classroom.label = 'Biology101'
      expect(classroom.label).to eq('Biology101')
    end
  end
end
