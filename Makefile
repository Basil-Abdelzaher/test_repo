#test
#compilation process make file

proj=main
CC=gcc

run: $(proj).exe
	@./$(proj).exe
	@echo "**********running done***********"
$(proj).i: $(proj).c
	$(CC) -E $(proj).c -o $(proj).i
	@echo "**********Preprocessing done***********"
$(proj).s: $(proj).i
	$(CC) -S $(proj).i -o $(proj).s
	@echo "**********Compilation done***********"
$(proj).o: $(proj).s 
	$(CC) -c $(proj).s -o $(proj).o
	@echo "**********Assembling done***********"
$(proj).exe: $(proj).o
	$(CC) $(proj).o -o $(proj).exe
	@echo "**********linking done***********"

clean:
	rm -f $(proj).i $(proj).s $(proj).o $(proj).exe
	@echo "**********cleaning done***********"
