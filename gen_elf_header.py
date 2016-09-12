import struct

def elf_ident():	# 7f45 4c46 0101 0100 0000 0000 0000 0000
	return b'\x7f\x45\x4c\x46\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00'

def elf_type():		# relocatable
	return struct.pack('<H', 1)

def elf_machine():	# 386
	return struct.pack('<H', 3)

def elf_version():	# current
	return struct.pack('<I', 1)

def elf_entry():	# 0 as this is not exe
	return struct.pack('<I', 0)

def elf_phoff():	# 0 
	return struct.pack('<I', 0)

def elf_shoff():	# 0
	return struct.pack('<I', 0)

def elf_flags():		# 0
	return struct.pack('<I', 0)

def elf_ehsize():		# 0x34
	return struct.pack('<H', 0x34)

def elf_phentsize():		# 0
	return struct.pack('<H', 0)

def elf_phnum():		# 0
	return struct.pack('<H', 0)

def elf_shentsize():		# 0
	return struct.pack('<H', 0)

def elf_shnum():		# 0
	return struct.pack('<H', 0)

def elf_shstrndx():		# 0
	return struct.pack('<H', 0)


f = file('test.obj', 'wb')
f.write(elf_ident())
f.write(elf_type())
f.write(elf_machine())
f.write(elf_version())
f.write(elf_entry())
f.write(elf_phoff())
f.write(elf_shoff())
f.write(elf_flags())
f.write(elf_ehsize())
f.write(elf_phentsize())
f.write(elf_phnum())
f.write(elf_shentsize())
f.write(elf_shnum())
f.write(elf_shstrndx())

f.close()
