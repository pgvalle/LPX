class QuadIter:
	DIRS = ("dir", "baixo", "esq", "cima")

	def __init__(self):
		self.i = 0
		self.dir_i = 0

	def __iter__(self):
		return self

	def __next__(self):
		if self.i == 10:
			self.i = 0
			self.dir_i = (self.dir_i + 1) % len(QuadIter.DIRS)
		self.i += 1
		return QuadIter.DIRS[self.dir_i]

# test
for dir in QuadIter():
	print(dir)
