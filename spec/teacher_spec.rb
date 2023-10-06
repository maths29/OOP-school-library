require_relative 'spec_helper'

describe Teacher do
  # Define a subject for reuse in the tests
  subject(:teacher) { Teacher.new('John Doe', 30, 'teacher', 'Math') }

  describe '#initialize' do
    it 'creates a Teacher instance' do
      expect(teacher).to be_an_instance_of(Teacher)
    end

    it 'sets the name, age, user_type, and specialization' do
      expect(teacher.name).to eq('John Doe')
      expect(teacher.age).to eq(30)
      expect(teacher.user_type).to eq('teacher')
      expect(teacher.specialization).to eq('Math')
    end
  end

  describe '#specialization' do
    it 'returns the specialization of the teacher' do
      expect(teacher.specialization).to eq('Math')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
