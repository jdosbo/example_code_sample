#Simple makefile which compiles sources into libraries
#and then links libraries into a target file.
#To add more classes one just needs to add the *.o file into $(LIB_OBJS)
#





CPPFLAGS  = -g -Wall -std=c++11
ARFLAGS = -rv
CC = g++


LIB_OBJS = Event.o Particle.o Event_Parser.o Kaon.o Pion.o 

TARGET = event_analyzer

$(TARGET): $(LIB_OBJS) event_analyzer.o
	$(CC) $(CPPFLAGS) -o $(TARGET) $(LIB_OBJS) event_analyzer.o

all:  $(LIB_OBJS) $(TARGET)


TEST_TARGET = test

$(TEST_TARGET): $(LIB_OBJS) test.o
	$(CC) $(CPPFLAGS) -o $(TEST_TARGET) $(LIB_OBJS) test.o

test: $(LIB_OBJS) $(TEST_TARGET)

clean:
	rm -f $(TARGET) $(LIB_OBJS) $(TEST_TARGET) test.o event_analyzer.o
