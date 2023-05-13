class TreeIter:
    def __init__(self, tree):
	    self.tree = tree
	    self.i = 0
	    self.stack = []

    def __iter__(self):
	    return self

    def __next__(self):
        # reached end of branch
        while self.i == len(self.tree):
            # stack empty and reached end of branch. Stop
            if len(self.stack) == 0:
                raise StopIteration

            self.tree, self.i = self.stack.pop()
            self.i += 1
        
        leaf = self.tree[self.i]
		# it's a branch
        while isinstance(leaf, list):
			# store state in stack
            self.stack.append((self.tree, self.i))
			# go to branch
            self.tree = leaf
            self.i = 0
			# set leaf
            leaf = self.tree[0]

        self.i += 1
        return leaf

# test
tree = [
	'aaa',
	[
		'xxx',
		'yyy',
	],
    'bbb'
]

for leaf in TreeIter(tree):
	print(leaf)
