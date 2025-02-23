# Default target builds all versions.
all: process_serial process_opt process_parallel

# --- Serial version ---
process_serial: main_process_serial.o png_util.o
	@gcc -O3 -o process_serial main_process_serial.o png_util.o -lm -lpng16

main_process_serial.o: main_process_serial.c
	@gcc -O3 -c main_process_serial.c

# --- Optimized version ---
process_opt: main_process_opt.o png_util.o
	@gcc -O3 -o process_opt main_process_opt.o png_util.o -lm -lpng16

main_process_opt.o: main_process_opt.c
	@gcc -O3 -c main_process_opt.c

# --- Parallel Version ---
process_parallel: main_process_parallel.o png_util.o
	@gcc -O2 -fopenmp -o process_parallel main_process_parallel.o png_util.o -lm -lpng16

main_process_parallel.o: main_process_parallel.c
	@gcc -O2 -fopenmp -c main_process_parallel.c

# Common utility code.
png_util.o: png_util.c
	@gcc -O3 -c png_util.c -lpng16

# --- Test targets ---
# Running "make test" will run all versions.
test: test_serial test_opt test_parallel

test_serial: process_serial
	@echo "Running Serial Version..."
	@./process_serial ./images/MSUStadium.png test_serial.png

test_opt: process_opt
	@echo "Running Optimized Version..."
	@./process_opt ./images/MSUStadium.png test_opt.png

test_parallel: process_parallel
	@echo "Running Parallel Version..."
	@./process_parallel ./images/MSUStadium.png test_parallel.png

# --- Clean up ---
clean:
	rm -f *.o process_serial process_opt process_parallel
