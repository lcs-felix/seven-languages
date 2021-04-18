class Tree
    attr_accessor :children, :node_name
  
    def initialize(structure)
      key = structure.keys.first
      @node_name = key
      @children = structure[key].map {|k, v| Tree.new(k => v)}
    end
  
    def visit_all(&block)
      visit &block
      children.each {|c| c.visit_all &block}
    end
  
    def visit(&block)
      block.call self
    end
end
  
# ruby_tree = Tree.new({'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}})

# puts "Visiting a node"
# ruby_tree.visit {|node| puts node.node_name}
# puts

# puts "visiting entire tree"
# ruby_tree.visit_all {|node| puts node.node_name}


Tree.new({'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}}).visit_all {|node| p node.node_name}
