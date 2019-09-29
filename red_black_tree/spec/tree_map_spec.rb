require 'spec_helper'
require 'tree_map'

RSpec.describe TreeMap do
  let(:tree_map)  { TreeMap.new }
  let(:unordered_array) { [8,5,9,8.8,7,1] }

  before  do
    unordered_array.each{|x| tree_map.insert_key(x) }
  end

  describe "#lower_key" do
    it "returns lower_key for a value" do
      expect(tree_map.lower_key(1)).to eql(nil)
      expect(tree_map.lower_key(5)).to eql(1)
      expect(tree_map.lower_key(9)).to eql(8.8)
      expect(tree_map.lower_key(8.8)).to eql(8)
      expect(tree_map.lower_key(7)).to eql(5)
      expect(tree_map.lower_key(100)).to eql(9)
      expect(tree_map.lower_key(6)).to eql(5)
    end

    it "returns lower value for a tree with two elements" do
      t_map = TreeMap.new
      t_map.insert(Node.new(4))
      t_map.insert(Node.new(1))
      expect(t_map.lower_key(1)).to eql(nil)
      expect(t_map.lower_key(2.3)).to eql(1)
      expect(t_map.lower_key(4)).to eql(1)
      expect(t_map.lower_key(5)).to eql(4)
      expect(t_map.lower_key(0.5)).to eql(nil)
      expect(t_map.lower_key(100)).to eql(4)
    end

    it "returns lower value for a tree with two elements" do
      t_map = TreeMap.new
      t_map.insert(Node.new(4))
      t_map.insert(Node.new(6))
      expect(t_map.lower_key(1)).to eql(nil)
      expect(t_map.lower_key(2.3)).to eql(nil)
      expect(t_map.lower_key(4)).to eql(nil)
      expect(t_map.lower_key(5)).to eql(4)
      expect(t_map.lower_key(6)).to eql(4)
      expect(t_map.lower_key(0.5)).to eql(nil)
      expect(t_map.lower_key(100)).to eql(6)
    end

    it "returns lower value for a tree with one element" do
      t_map = TreeMap.new
      t_map.insert(Node.new(4))
      expect(t_map.lower_key(1)).to eql(nil)
      expect(t_map.lower_key(2.3)).to eql(nil)
      expect(t_map.lower_key(4)).to eql(nil)
      expect(t_map.lower_key(5)).to eql(4)
      expect(t_map.lower_key(100)).to eql(4)
    end

    it "returns lower value for a tree with no element" do
      t_map = TreeMap.new
      expect(t_map.lower_key(1)).to eql(nil)
      expect(t_map.lower_key(2.3)).to eql(nil)
      expect(t_map.lower_key(4)).to eql(nil)
      expect(t_map.lower_key(100)).to eql(nil)
    end
  end

  describe "#flooring_key" do
    it "returns flooring_key for a value" do
      expect(tree_map.flooring_key(1)).to eql(1)
      expect(tree_map.flooring_key(5)).to eql(5)
      expect(tree_map.flooring_key(9)).to eql(9)
      expect(tree_map.flooring_key(8.9)).to eql(8.8)
      expect(tree_map.flooring_key(7)).to eql(7)
      expect(tree_map.flooring_key(100)).to eql(9)
      expect(tree_map.flooring_key(6)).to eql(5)
    end

    it "returns flooring key for a tree with two elements" do
      t_map = TreeMap.new
      t_map.insert(Node.new(4))
      t_map.insert(Node.new(1))
      expect(t_map.flooring_key(1)).to eql(1)
      expect(t_map.flooring_key(2.3)).to eql(1)
      expect(t_map.flooring_key(4)).to eql(4)
      expect(t_map.flooring_key(5)).to eql(4)
      expect(t_map.flooring_key(0.5)).to eql(nil)
      expect(t_map.flooring_key(100)).to eql(4)
    end

    it "returns flooring key for a tree with two elements" do
      t_map = TreeMap.new
      t_map.insert(Node.new(4))
      t_map.insert(Node.new(6))
      expect(t_map.flooring_key(1)).to eql(nil)
      expect(t_map.flooring_key(2.3)).to eql(nil)
      expect(t_map.flooring_key(4)).to eql(4)
      expect(t_map.flooring_key(5)).to eql(4)
      expect(t_map.flooring_key(0.5)).to eql(nil)
      expect(t_map.flooring_key(100)).to eql(6)
      expect(t_map.flooring_key(6)).to eql(6)
    end

    it "returns flooring key for a tree with one element" do
      t_map = TreeMap.new
      t_map.insert(Node.new(4))
      expect(t_map.flooring_key(1)).to eql(nil)
      expect(t_map.flooring_key(2.3)).to eql(nil)
      expect(t_map.flooring_key(4)).to eql(4)
      expect(t_map.flooring_key(0.5)).to eql(nil)
      expect(t_map.flooring_key(100)).to eql(4)
    end

    it "returns flooring key for a tree with no elements" do
      t_map = TreeMap.new
      expect(t_map.flooring_key(1)).to eql(nil)
      expect(t_map.flooring_key(4)).to eql(nil)
    end
  end

  describe "#higher_key" do
    it "returns higher_key for a value" do
      expect(tree_map.higher_key(1)).to eql(5)
      expect(tree_map.higher_key(5)).to eql(7)
      expect(tree_map.higher_key(9)).to eql(nil)
      expect(tree_map.higher_key(8.8)).to eql(9)
      expect(tree_map.higher_key(7)).to eql(8)
      expect(tree_map.higher_key(100)).to eql(nil)
      expect(tree_map.higher_key(6)).to eql(7)
    end

    it "returns higher value for a tree with two elements" do
      t_map = TreeMap.new
      t_map.insert(Node.new(4))
      t_map.insert(Node.new(1))
      expect(t_map.higher_key(1)).to eql(4)
      expect(t_map.higher_key(2.3)).to eql(4)
      expect(t_map.higher_key(4)).to eql(nil)
      expect(t_map.higher_key(5)).to eql(nil)
      expect(t_map.higher_key(0.5)).to eql(1)
    end

    it "returns higher value for a tree with two elements" do
      t_map = TreeMap.new
      t_map.insert(Node.new(4))
      t_map.insert(Node.new(6))
      expect(t_map.higher_key(1)).to eql(4)
      expect(t_map.higher_key(2.3)).to eql(4)
      expect(t_map.higher_key(4)).to eql(6)
      expect(t_map.higher_key(5)).to eql(6)
      expect(t_map.higher_key(0.5)).to eql(4)
      expect(t_map.higher_key(10)).to eql(nil)
      expect(t_map.higher_key(6)).to eql(nil)
    end

    it "returns higher key for a tree with one element" do
      t_map = TreeMap.new
      t_map.insert(Node.new(4))
      expect(t_map.higher_key(1)).to eql(4)
      expect(t_map.higher_key(4)).to eql(nil)
      expect(t_map.higher_key(4.1)).to eql(nil)
      expect(t_map.higher_key(5)).to eql(nil)
    end

    it "returns ceiling key for a tree with no elements" do
      t_map = TreeMap.new
      expect(t_map.ceiling_key(1)).to eql(nil)
      expect(t_map.ceiling_key(4)).to eql(nil)
    end
  end

  describe "#ceiling_key" do
    it "returns ceiling_key for a value" do
      expect(tree_map.ceiling_key(1)).to eql(1)
      expect(tree_map.ceiling_key(5)).to eql(5)
      expect(tree_map.ceiling_key(9)).to eql(9)
      expect(tree_map.ceiling_key(8.8)).to eql(8.8)
      expect(tree_map.ceiling_key(8.9)).to eql(9)
      expect(tree_map.ceiling_key(8.4)).to eql(8.8)
      expect(tree_map.ceiling_key(7)).to eql(7)
      expect(tree_map.ceiling_key(100)).to eql(nil)
      expect(tree_map.ceiling_key(6)).to eql(7)
    end

    it "returns ceiling key for a tree with two elements" do
      t_map = TreeMap.new
      t_map.insert(Node.new(4))
      t_map.insert(Node.new(1))
      expect(t_map.ceiling_key(1)).to eql(1)
      expect(t_map.ceiling_key(4)).to eql(4)
      expect(t_map.ceiling_key(3.4)).to eql(4)
      expect(t_map.ceiling_key(0.4)).to eql(1)
      expect(t_map.ceiling_key(100)).to eql(nil)
    end

    it "returns ceiling key for a tree with two elements" do
      t_map = TreeMap.new
      t_map.insert(Node.new(4))
      t_map.insert(Node.new(5))
      expect(t_map.ceiling_key(1)).to eql(4)
      expect(t_map.ceiling_key(4)).to eql(4)
      expect(t_map.ceiling_key(4.1)).to eql(5)
      expect(t_map.ceiling_key(5)).to eql(5)
      expect(t_map.ceiling_key(6)).to eql(nil)
    end

    it "returns ceiling key for a tree with one element" do
      t_map = TreeMap.new
      t_map.insert(Node.new(4))
      expect(t_map.ceiling_key(1)).to eql(4)
      expect(t_map.ceiling_key(4)).to eql(4)
      expect(t_map.ceiling_key(4.1)).to eql(nil)
      expect(t_map.ceiling_key(5)).to eql(nil)
    end

    it "returns ceiling key for a tree with no elements" do
      t_map = TreeMap.new
      expect(t_map.ceiling_key(1)).to eql(nil)
      expect(t_map.ceiling_key(4)).to eql(nil)
    end
  end

end
