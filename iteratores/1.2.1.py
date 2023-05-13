class StringIter:
	def __init__(self, string):
		self.string = string
		self.i = 0
		self.j = len(string)

	def __iter__(self):
		return self

	def __next__(self):
		if self.i == self.j:
			raise StopIteration
		self.i += 1
		return self.string[self.i - 1]

# test
string = input("De uma string para iterar: ")
for c in StringIter(string):
	print(c)
