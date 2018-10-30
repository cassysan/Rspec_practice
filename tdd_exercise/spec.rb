class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name
    if @middle_name.nil?
      "#{@first_name} #{@last_name}"
    else
      "#{@first_name} #{@middle_name} #{@last_name}"
    end
  end

  def full_name_with_middle_initial
    if @middle_name.nil?
      @first_name.capitalize + " " + @last_name.capitalize
    else
      @first_name.capitalize + " " + @middle_name.capitalize[0]+ "." + " " + @last_name.capitalize
    end
  end

  def initials
    if @middle_name.nil?
      @first_name.capitalize[0] + @last_name.capitalize[0]
    else
      @first_name.capitalize[0] + @middle_name.capitalize[0] + @last_name.capitalize[0]
    end
  end
  # implement your behavior here
end

RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      person = Person.new(first_name: "Cassy", middle_name: "Marie", last_name: "Myers")

      expect(person.full_name).to eq("Cassy Marie Myers")
    end

    it "does not add extra spaces if middle name is missing" do
      person = Person.new(first_name: "Raylene", last_name: "Myers")

      expect(person.full_name).to eq("Raylene Myers")
    end
  end

  describe "#full_name_with_middle_initial" do
    it "concatenates first name and last name with spaces and adds a middle initial" do
      person = Person.new(first_name: "cassy", middle_name: "marie", last_name: "myers")

      expect(person.full_name_with_middle_initial).to eq("Cassy M. Myers")
    end

    it "capitalizes the first and last names, and adds a capitalized middle initial" do
      person = Person.new(first_name: "David", middle_name: "lee", last_name: "Lung")

      expect(person.full_name_with_middle_initial).to eq("David L. Lung")
    end

    it "Returns only first and last name if no middle initial exists" do
      person = Person.new(first_name: "Jason", last_name: "stevens")

      expect(person.full_name_with_middle_initial).to eq("Jason Stevens")
    end
  end

  describe "#initials" do
    it "returns only 3 letters if middle name is nil" do
      person = Person.new(first_name: "leslie", middle_name: "marie", last_name: "garrison")

      expect(person.initials).to eq("LMG")
    end

    it "returns 2 letters if middle name is nil" do
      person = Person.new(first_name: "Leslie", last_name: "garrison")

      expect(person.initials).to eq("LG")
    end

    it "returns captialized letters" do
      person = Person.new(first_name: "cassy", middle_name: "marie", last_name: "myers")

      expect(person.initials).to eq("CMM")
    end
  end
end
