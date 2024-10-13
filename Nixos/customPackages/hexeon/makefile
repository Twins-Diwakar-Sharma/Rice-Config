#program name
prog =hexeon

#directories
srcDir =source
incDir =include
bldDir =build
binDir =binary
resDir =res

cc =g++
incl =-I$(incDir)
lib =-lGL -lglfw -ldl -lwayland-cursor
flag =-pthread -MP -MD

classes =$(shell find $(srcDir) -name "*.cpp")
objects =$(patsubst $(srcDir)/%, $(bldDir)/%, $(classes:.cpp=.o))
dependencies =$(patsubst $(bldDir)/%, $(bldDir)/%, $(objects:.o=.d))

all:	directories $(prog)

directories:
	@mkdir -p $(binDir)
	@mkdir -p $(bldDir)

$(prog): $(objects)
	$(cc) -o $(binDir)/$@ $^ $(lib)

$(bldDir)/%.o:	$(srcDir)/%.cpp
	$(cc) -o $@ -c $< $(flag) $(incl)

clean:
	@rm -rf $(bldDir)

remove:	clean
	@rm -rf $(binDir)

install: 
	@mkdir -p $(binDir)/$(resDir)
	@cp -r $(resDir)/* $(binDir)/$(resDir)/

-include $(dependencies)
