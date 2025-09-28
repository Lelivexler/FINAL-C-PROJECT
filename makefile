# Target: assembler
assembler: main.o first_pass.o macro_table.o pre_proccesor.o second_pass.o functions.o check.o
	gcc -Wall -ansi -pedantic main.o first_pass.o macro_table.o pre_proccesor.o second_pass.o functions.o check.o -o assembler

# Compile main.c into main.o
main.o: main.c assembler.h check.h
	gcc -c -Wall -ansi -pedantic main.c -o main.o

# Compile first_pass.c into first_pass.o
first_pass.o: first_pass.c assembler.h check.h
	gcc -c -Wall -ansi -pedantic first_pass.c -o first_pass.o

# Compile macro_table.c into macro_table.o
macro_table.o: macro_table.c assembler.h
	gcc -c -Wall -ansi -pedantic macro_table.c -o macro_table.o

# Compile pre_proccesor.c into pre_proccesor.o
pre_proccesor.o: pre_proccesor.c assembler.h
	gcc -c -Wall -ansi -pedantic pre_proccesor.c -o pre_proccesor.o

# Compile second_pass.c into second_pass.o
second_pass.o: second_pass.c assembler.h check.h
	gcc -c -Wall -ansi -pedantic second_pass.c -o second_pass.o

# Compile functions.c into functions.o
functions.o: functions.c assembler.h
	gcc -c -Wall -ansi -pedantic functions.c -o functions.o

# Compile check.c into check.o
check.o: check.c check.h assembler.h
	gcc -c -Wall -ansi -pedantic check.c -o check.o

# Target: clean
clean:
	rm -f *.o assembler

# Target: run
run: assembler
	./assembler
