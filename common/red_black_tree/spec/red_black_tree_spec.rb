require 'spec_helper'
require 'red_black_tree'

RSpec.describe RedBlackTree do
  let(:red_black_tree)  { RedBlackTree.new }
  let(:unordered_array) { [8,5,9,8.8,7,1] }

  before  do
    unordered_array.each{|x| red_black_tree.insert(Node.new(x)) }
  end

  describe "#inorder_walk" do
    it "returns the tree elements in order" do
      expect(red_black_tree.inorder_walk).to match(unordered_array.sort)
    end
  end

  describe "#minimum" do
    it "returns minimum key in the tree" do
      expect(red_black_tree.minimum.key).to eql(1)
    end
  end

  describe "#maximum" do
    it "returns maximum key in the tree" do
      expect(red_black_tree.maximum.key).to eql(9)
    end
  end

  describe "#tree_minimum" do
    it "returns minimum key at sub-tree" do
      expect(red_black_tree.send(:tree_minimum,red_black_tree.root).key).to eql(1)
    end
  end

  describe "#tree_maximum" do
    it "returns maximum key at sub-tree" do
      expect(red_black_tree.send(:tree_maximum, red_black_tree.root).key).to eql(9)
    end
  end

  describe "#find_key" do
    it "returns whether the tree contains a key" do
      expect(red_black_tree.find_key(8)).to be
      expect(red_black_tree.find_key(8.8)).to be
      expect(red_black_tree.find_key(9)).to be
      expect(red_black_tree.find_key(5)).to be
      expect(red_black_tree.find_key(7)).to be
      expect(red_black_tree.find_key(1)).to be
      expect(red_black_tree.find_key(100)).to be_nil
      expect(red_black_tree.find_key(-1)).to be_nil
    end
  end

  describe "#contains?" do
    it "returns whether the tree contains a key" do
      expect(red_black_tree.contains?(8)).to eql(true)
      expect(red_black_tree.contains?(8.8)).to eql(true)
      expect(red_black_tree.contains?(9)).to eql(true)
      expect(red_black_tree.contains?(5)).to eql(true)
      expect(red_black_tree.contains?(7)).to eql(true)
      expect(red_black_tree.contains?(1)).to eql(true)
      expect(red_black_tree.contains?(100)).to eql(false)
      expect(red_black_tree.contains?(-1)).to eql(false)
    end

    it "returns the presence of a key in a tree with two elements" do
      rb_tree = RedBlackTree.new
      rb_tree.insert(Node.new(4))
      rb_tree.insert(Node.new(1))
      expect(rb_tree.contains?(4)).to eql(true)
      expect(rb_tree.contains?(1)).to eql(true)
      expect(rb_tree.contains?(11)).to eql(false)
      expect(rb_tree.contains?(100)).to eql(false)
    end

    it "returns the presence of a key in a tree with two elements" do
      rb_tree = RedBlackTree.new
      rb_tree.insert(Node.new(4))
      rb_tree.insert(Node.new(6))
      expect(rb_tree.contains?(4)).to eql(true)
      expect(rb_tree.contains?(6)).to eql(true)
      expect(rb_tree.contains?(11)).to eql(false)
      expect(rb_tree.contains?(100)).to eql(false)
    end

  end
end
