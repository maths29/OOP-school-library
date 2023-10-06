require_relative 'student'

describe Student do
  let(:student) { Student.new("Alice", 18, "Student", true) }

  it "initializes with name, age, user_type, and parent_permission" do
    expect(student.name).to eq("Alice")
    expect(student.age).to eq(18)
    expect(student.user_type).to eq("Student")
    expect(student.parent_permission).to be(true)
  end

  it "sets and retrieves a classroom" do
    classroom = double("Classroom")
    student.classroom = classroom

    expect(student.instance_variable_get(:@classroom)).to eq(classroom)
  end

  it "prevents duplicate student additions to a classroom" do
    classroom = double("Classroom")
    allow(classroom).to receive(:students).and_return([student])

    student.classroom = classroom

    expect(classroom.students).to contain_exactly(student)
  end

  it "plays hooky" do
    expect(student.play_hooky).to eq('¯(ツ)/¯')
  end
end
