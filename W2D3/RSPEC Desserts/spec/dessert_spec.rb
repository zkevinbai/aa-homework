require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:tiramisu) {Dessert.new("tiramisu", 2, "chef")}

  describe "#initialize" do
    it "sets a type" do
      expect(tiramisu.type).to eq("tiramisu")
    end 

    it "sets a quantity" do 
      expect(tiramisu.quantity).to be_an_instance_of(Integer)
    end 

    it "starts ingredients as an empty array" do
      expect(tiramisu.ingredients).to eq([])
    end 

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("tiramisu", "FIVE", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      tiramisu.add_ingredient("chocolate")
    end 
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      tiramisu.add_ingredient("chocolate")
      tiramisu.add_ingredient("vanilla")
      tiramisu.add_ingredient("creme fraiche")
      tiramisu.add_ingredient("coconut")
      tiramisu.add_ingredient("milk")      
      prev = tiramisu.ingredients.dup
      tiramisu.mix!
      expect(prev).not_to eq(tiramisu.ingredients)
    end 
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      prev_q = tiramisu.quantity.dup

      tiramisu.eat(1)
      expect(prev_q).not_to eq(tiramisu.quantity)
    end 

    it "raises an error if the amount is greater than the quantity" do
      expect { tiramisu.eat(100) }.to raise_error("not enough left!")
    end 
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
    service = tiramisu.serve

    chef_name = tiramisu.chef
  
    expect(service).to include(chef_name.titleize)
    end 
  end

  describe "#make_more" do 
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(tiramisu)

      chef.bake(tiramisu)
    end 
  end
end
